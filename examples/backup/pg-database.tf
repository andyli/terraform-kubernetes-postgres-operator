# https://access.crunchydata.com/documentation/postgres-operator/v5/tutorial/create-cluster/

locals {
  dbname          = "testing"
  postgresVersion = 13
  # https://www.crunchydata.com/developers/download-postgres/containers
  images = {
    postgres   = "registry.developers.crunchydata.com/crunchydata/crunchy-postgres:ubi8-13.7-0"
    pgbackrest = "registry.developers.crunchydata.com/crunchydata/crunchy-pgbackrest:ubi8-2.38-1"
    pgbouncer  = "registry.developers.crunchydata.com/crunchydata/crunchy-pgbouncer:ubi8-1.16-3"
  }
}

# Note that we have to create `module.postgres-operator` first:
# `terraform apply -target module.postgres-operator`
# P.S. `depends_on` is not sufficient.
# See https://github.com/hashicorp/terraform-provider-kubernetes/issues/1367
resource "kubernetes_manifest" "database" {
  depends_on = [
    module.postgres-operator
  ]

  manifest = {
    "apiVersion" = "postgres-operator.crunchydata.com/v1beta1"
    "kind"       = "PostgresCluster"
    "metadata" = {
      "name"      = "testpostgres"
      "namespace" = "default"
    }
    "spec" = {
      "databaseInitSQL" = {
        "name" = kubernetes_config_map.postgres_init.metadata[0].name
        "key"  = "init.sql"
      }

      # https://access.crunchydata.com/documentation/postgres-operator/5.0.4/tutorial/user-management/
      "users" = [
        {
          # "postgres" is the default superuser
          name = "postgres"
        },
        {
          name      = "test"
          databases = [local.dbname]
        },
      ]

      "backups" = {
        "pgbackrest" = {
          "image" = local.images.pgbackrest
          "repos" = [
            {
              "name" = "repo1"
              "s3" = {
                "bucket"   = local.s3_bucket
                "endpoint" = local.s3_endpoint
                "region"   = local.s3_region
              }
            },
          ]
          "global" = {
            "repo1-s3-uri-style"        = "path"

            # we're using self-signed cert
            "repo1-storage-verify-tls"  = "n"

            # retent 7 days
            "repo1-retention-full"      = "7"
            "repo1-retention-full-type" = "time"
          }
          "configuration" = [{
            "secret" = {
              "name" = kubernetes_secret.repo_credentials.metadata[0].name
            }
          }]

          # to trigger manual backup:
          # kubectl annotate postgrescluster testpostgres postgres-operator.crunchydata.com/pgbackrest-backup="$(date)" --overwrite
          "manual" = {
            "repoName" = "repo1"
            "options" = [
              "--type=full",
            ]
          }
        }
      }

      "image" = local.images.postgres
      "instances" = [
        {
          "dataVolumeClaimSpec" = {
            "accessModes" = [
              "ReadWriteOnce",
            ]
            "resources" = {
              "requests" = {
                "storage" = "1Gi"
              }
            }
          }
          "name" = "testpostgres-1"
        },
      ]
      "postgresVersion" = local.postgresVersion
      "proxy" = {
        "pgBouncer" = {
          "image" = local.images.pgbouncer
        }
      }
    }
  }
}

resource "kubernetes_config_map" "postgres_init" {
  metadata {
    name = "postgres-init"
  }

  # doc for "\c dbname": https://www.postgresql.org/docs/13/app-psql.html
  data = {
    "init.sql" = <<-EOF
      \set ON_ERROR_STOP
      \c ${local.dbname}
      CREATE EXTENSION IF NOT EXISTS postgis;
      \echo 'Created postgis extension(s) for ${local.dbname}'
    EOF
  }
}

resource "kubernetes_secret" "repo_credentials" {
  metadata {
    name = "postgres-repo-creds"
  }
  data = {
    "s3.conf" = <<-EOF
      [global]
      repo1-s3-key=${local.s3_aws_access_key_id}
      repo1-s3-key-secret=${local.s3_aws_secret_access_key}
    EOF
  }
}
