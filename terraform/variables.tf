variable "chart_path" {
  description = "Path to the Helm chart"
  type        = string
  default     = "oci://docker.io/marcostmunhoz/fiap-tech-challenge-fastfood-helm"
}

variable "db_username" {
  description = "Database username"
  type        = string
  default     = "monolith"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "monolith"
}

variable "jwt_secret" {
  description = "JWT secret"
  type        = string
  sensitive   = true
}

variable "monorepo_state_encryption_key" {
  description = "Encryption key for the monorepo state"
  type        = string
  sensitive   = true
}
