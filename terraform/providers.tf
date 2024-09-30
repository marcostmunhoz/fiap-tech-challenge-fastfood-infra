terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.4.0"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 6.4.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.15.0"
    }
  }
}

provider "google" {
  project = local.google.project
  region  = local.google.region
}

provider "helm" {
  kubernetes {
    host                   = "https://${google_container_cluster.cluster.endpoint}"
    token                  = data.google_client_config.default.access_token
    client_certificate     = base64decode(google_container_cluster.cluster.master_auth.0.client_certificate)
    client_key             = base64decode(google_container_cluster.cluster.master_auth.0.client_key)
    cluster_ca_certificate = base64decode(google_container_cluster.cluster.master_auth.0.cluster_ca_certificate)
  }
}
