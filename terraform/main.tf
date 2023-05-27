resource "vault_github_auth_backend" "blinkbyte" {
  organization = "BLINKBYTE"
}



module "James" {
    source = "./users"
    vault_github_auth_backend = vault_github_auth_backend.blinkbyte
    google_auth_backend = vault_jwt_auth_backend.google
    github_username = "byteford"
    users_name = "James Sandford"
    google_email = "James.sandford@blinkbyte.co.uk"
}

module "Wale" {
    source = "./users"
    vault_github_auth_backend = vault_github_auth_backend.blinkbyte
    google_auth_backend = vault_jwt_auth_backend.google
    github_username = "sirlegendary"
    users_name = "Wale Salami"
    google_email = "salamiwale@gmail.com"
}

module "policies" {
    source = "./policies"
}

module "aws" {
    source = "./aws"
    url = var.vault_url
    ip = var.vault_ip
}