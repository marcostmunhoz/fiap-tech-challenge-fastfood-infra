variable "chart_path" {
  description = "Path to the Helm chart"
  type        = string
}

variable "chart_version" {
  description = "Version of the Helm chart"
  type        = string
}

variable "db_host" {
  description = "Database host"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "jwt_secret" {
  description = "JWT secret"
  type        = string
  sensitive   = true
}
