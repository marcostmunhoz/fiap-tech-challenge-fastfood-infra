terraform {
  backend "gcs" {
    bucket = "fiap-pos-graduacao-terraform-state"
    prefix = "tech-challenge-k8s"
  }
}
