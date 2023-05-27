resource "vault_github_auth_backend" "blinkbyte" {
  organization = "BLINKBYTE"
}



module "James" {
    source = "./users"
    vault_github_auth_backend = vault_github_auth_backend.blinkbyte
    github_username = "byteford"
    users_name = "James Sandford"
}

module "Wale" {
    source = "./users"
    vault_github_auth_backend = vault_github_auth_backend.blinkbyte
    github_username = "sirlegendary"
    users_name = "Wale Salami"
}

module "policies" {
    source = "./policies"
}

module "aws" {
    source = "./aws"
    url = var.vault_url
    ip = var.vault_ip
}