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
  name    = "fastfood"
  chart   = var.chart_path
  version = var.chart_version

  set_sensitive {
    name  = "kitchen.db.host"
    value = data.terraform_remote_state.sql_instance.outputs.cloud_sql_instance_ip
  }

  set_sensitive {
    name  = "kitchen.db.username"
    value = var.kitchen_db_username
  }

  set_sensitive {
    name  = "kitchen.db.password"
    value = var.kitchen_db_password
  }

  set_sensitive {
    name  = "kitchen.db.name"
    value = var.kitchen_db_name
  }

  set_sensitive {
    name  = "kitchen.jwt.secret"
    value = var.jwt_secret
  }

  set_sensitive {
    name  = "order.db.host"
    value = data.terraform_remote_state.sql_instance.outputs.cloud_sql_instance_ip
  }

  set_sensitive {
    name  = "order.db.username"
    value = var.order_db_username
  }

  set_sensitive {
    name  = "order.db.password"
    value = var.order_db_password
  }

  set_sensitive {
    name  = "order.db.name"
    value = var.order_db_name
  }

  set_sensitive {
    name  = "order.jwt.secret"
    value = var.jwt_secret
  }

  set_sensitive {
    name  = "payment.db.host"
    value = data.terraform_remote_state.sql_instance.outputs.cloud_sql_instance_ip
  }

  set_sensitive {
    name  = "payment.db.username"
    value = var.payment_db_username
  }

  set_sensitive {
    name  = "payment.db.password"
    value = var.payment_db_password
  }

  set_sensitive {
    name  = "payment.db.name"
    value = var.payment_db_name
  }

  set_sensitive {
    name  = "payment.jwt.secret"
    value = var.jwt_secret
  }
}

