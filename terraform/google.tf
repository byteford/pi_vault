resource "vault_jwt_auth_backend" "google" {
    description         = "google login for vault"
    path                = "google"
    type                = "oidc"
    oidc_discovery_url  = "https://accounts.google.com"
    oidc_client_id      = var.google_client_id
    oidc_client_secret  = var.google_secret
    default_role        = "default"
}

resource "vault_jwt_auth_backend_role" "google" {
  backend         = vault_jwt_auth_backend.google.path
  role_name       = "default"
  token_policies  = ["default"]

  user_claim            = "sub"
  role_type             = "oidc"
  allowed_redirect_uris = ["https://${var.vault_url}:8200/ui/vault/auth/google/oidc/callback,http://localhost:8250/google/callback"]
}