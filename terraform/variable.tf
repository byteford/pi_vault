variable "vault_url" {
    type = string
    description = "url for the vault server"
}

variable "vault_ip" {
    type = string
    description = "ip of the vault server"
}
variable "google_client_id"{
    type = string
    description = "client id for google login"
}
variable "google_secret"{
    type = string
    description = "secret for google login"
}

variable "gsuite_service_account" {
  type = string
  description = "service_account json"
}

variable "gsuite_admin_impersonate" {
  type = string
  description = "email of a gsuite admin"
}