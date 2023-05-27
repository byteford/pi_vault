resource "vault_github_auth_backend" "blinkbyte" {
  organization = "BLINKBYTE"
}

resource "vault_jwt_auth_backend" "google" {
    description         = "google login for vault"
    path                = "google"
    type                = "oidc"
    oidc_discovery_url  = "https://accounts.google.com"
    oidc_client_id      = var.google_client_id
    oidc_client_secret  = var.google_secret
    provider_config = {
      fetch_user_info = true
    }
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