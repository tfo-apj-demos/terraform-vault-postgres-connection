variable "vault_mount_postgres_path" {
  type = string
}
variable "database_connection_name" {
  type = string
}
variable "database_username" {
  type = string
}
variable "database_password" {
  type = string
  default = ""
}
variable "database_addresses" {
  type = list(string)
}
variable "database_port" {
  type = number
  default = 5432
}
variable "database_name" {}
variable "database_sslmode" {
  type = string
  default = "prefer"
  validation {
    condition = contains([
      "disable",
      "allow",
      "prefer",
      "require",
      "verify-ca",
      "verify-full"
    ], var.database_sslmode)
    error_message = "database_sslmode value should be one of: disable, allow, prefer, require, verify-ca, or verify-full."
  }
}
variable "database_roles" {
  type = list(object({
    name = string
    creation_statements = list(string)
  }))
}