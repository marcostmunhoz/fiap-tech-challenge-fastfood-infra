data "google_client_config" "default" {}

data "terraform_remote_state" "sql_instance" {
  backend = "gcs"
  config = {
    bucket         = local.monorepo.bucket
    prefix         = local.monorepo.prefix
    encryption_key = var.monorepo_state_encryption_key
  }
}

resource "google_container_cluster" "cluster" {
  name                = "${local.google.project}-cluster"
  enable_autopilot    = true
  deletion_protection = false
}

resource "helm_release" "chart" {
  name  = "fastfood"
  chart = var.chart_path

  set_sensitive {
    name  = "monolith.db.host"
    value = data.terraform_remote_state.sql_instance.outputs.cloud_sql_instance_ip
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

