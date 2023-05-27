variable "vault_github_auth_backend" {
  description = "The github auth backend object"
}

variable "github_username" {
  description = "The users, github username"
}

variable "users_name" {
  description = "The name of the user"
}

variable "google_email" {
  description = "The users, google email address"
  default = ""
}

variable "google_auth_backend" {
  description = "The google auth backend object"
  default = {}
}
