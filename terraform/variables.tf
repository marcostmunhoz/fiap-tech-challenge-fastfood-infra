variable "chart_path" {
  description = "Path to the Helm chart"
  type        = string
  default     = "oci://docker.io/marcostmunhoz/fiap-tech-challenge-fastfood-helm"
}

variable "chart_version" {
  description = "Helm chart version"
  type        = string
  default     = null
}

variable "kitchen_db_username" {
  description = "Database username"
  type        = string
  default     = "kitchen"
}

variable "kitchen_db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "kitchen_db_name" {
  description = "Database name"
  type        = string
  default     = "kitchen"
}

variable "order_db_username" {
  description = "Database username"
  type        = string
  default     = "order"
}

variable "order_db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "order_db_name" {
  description = "Database name"
  type        = string
  default     = "order"
}

variable "payment_db_host" {
  description = "Database host"
  type        = string
}

variable "payment_db_username" {
  description = "Database username"
  type        = string
  default     = "payment"
}

variable "payment_db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "payment_db_name" {
  description = "Database name"
  type        = string
  default     = "payment"
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
