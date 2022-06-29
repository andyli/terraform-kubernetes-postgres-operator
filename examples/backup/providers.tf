terraform {
  required_version = "~> 1.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.5"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~> 3.4"
    }
  }
}
