data "google_client_config" "default" {}

resource "google_container_cluster" "cluster" {
  name                = "${local.google.project}-cluster"
  enable_autopilot    = true
  deletion_protection = false
}

resource "helm_release" "chart" {
  name    = "fastfood"
  chart   = var.chart_path
  version = var.chart_version

  set_sensitive {
    name  = "monolith.db.host"
    value = var.db_host
  }

  set_sensitive {
    name  = "monolith.db.username"
    value = var.db_username
  }

  set_sensitive {
    name  = "monolith.db.password"
    value = var.db_password
  }

  set_sensitive {
    name  = "monolith.db.name"
    value = var.db_name
  }

  set_sensitive {
    name  = "monolith.jwt.secret"
    value = var.jwt_secret
  }
}

