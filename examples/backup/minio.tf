locals {
  s3_bucket                = "backup"
  s3_region                = "us-east-1"
  s3_endpoint              = "minio:9000"
  s3_aws_access_key_id     = "minio"
  s3_aws_secret_access_key = "password"
}

resource "tls_private_key" "minio" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "minio" {
  private_key_pem = tls_private_key.minio.private_key_pem

  validity_period_hours = 120
  early_renewal_hours   = 3

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]

  dns_names = ["minio", "localhost", "k3s-server"]
  # ip_addresses = []

  subject {
    common_name  = "minio"
    organization = "testing"
  }
}

resource "kubernetes_secret_v1" "minio" {
  metadata {
    name = "minio"
  }

  data = {
    "MINIO_ROOT_USER"     = local.s3_aws_access_key_id
    "MINIO_ROOT_PASSWORD" = local.s3_aws_secret_access_key
    "private.key"         = tls_private_key.minio.private_key_pem
    "public.crt"          = tls_self_signed_cert.minio.cert_pem
  }
}

resource "kubernetes_stateful_set_v1" "minio" {
  metadata {
    name = "minio"
    labels = {
      "app.kubernetes.io/name"     = "minio"
      "app.kubernetes.io/instance" = "minio"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        "app.kubernetes.io/name"     = "minio"
        "app.kubernetes.io/instance" = "minio"
      }
    }

    service_name = "minio"

    template {
      metadata {
        labels = {
          "app.kubernetes.io/name"     = "minio"
          "app.kubernetes.io/instance" = "minio"
        }
      }

      spec {
        container {
          image = "quay.io/minio/minio:RELEASE.2022-06-20T23-13-45Z"
          name  = "minio"

          command = [
            "minio", "server", "/data",
          ]

          port {
            container_port = 9000
          }

          env {
            name = "MINIO_ROOT_USER"
            value_from {
              secret_key_ref {
                name = "minio"
                key  = "MINIO_ROOT_USER"
              }
            }
          }
          env {
            name = "MINIO_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = "minio"
                key  = "MINIO_ROOT_PASSWORD"
              }
            }
          }

          volume_mount {
            name       = "minio-data"
            mount_path = "/data"
            read_only  = false
          }

          volume_mount {
            name       = "tls"
            mount_path = "/root/.minio/certs/private.key"
            sub_path   = "private.key"
            read_only  = true
          }
          volume_mount {
            name       = "tls"
            mount_path = "/root/.minio/certs/public.crt"
            sub_path   = "public.crt"
            read_only  = true
          }
        }

        init_container {
          image = "busybox:1.34"
          name  = "init-data"

          command = [
            "mkdir", "-p", "/data/${local.s3_bucket}",
          ]

          volume_mount {
            name       = "minio-data"
            mount_path = "/data"
            read_only  = false
          }
        }

        volume {
          name = "tls"
          secret {
            secret_name = kubernetes_secret_v1.minio.metadata[0].name
          }
        }
      }
    }

    volume_claim_template {
      metadata {
        name = "minio-data"
      }

      spec {
        access_modes = ["ReadWriteOnce"]

        resources {
          requests = {
            storage = "1Gi"
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "minio" {
  metadata {
    name = "minio"
  }

  spec {
    selector = {
      "app.kubernetes.io/name"     = "minio"
      "app.kubernetes.io/instance" = "minio"
    }

    port {
      name      = "api"
      protocol  = "TCP"
      port      = 9000
      node_port = 30900
    }

    type = "NodePort"
  }
}
