locals {
  google = {
    project  = "fiap-pos-graduacao"
    region   = "southamerica-east1"
    location = "southamerica-east1"
  }

  monorepo = {
    bucket = "fiap-pos-graduacao-terraform-state"
    prefix = "tech-challenge-monorepo"
  }
}
