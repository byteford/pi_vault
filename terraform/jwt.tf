resource "vault_jwt_auth_backend" "terraform" {
    description         = "Demonstration of the Terraform JWT auth backend"
    path                = "jwt/terraform"
    oidc_discovery_url  = "https://app.terraform.io"
    bound_issuer        = "https://app.terraform.io"
}

resource "vault_jwt_auth_backend_role" "terraform" {
  backend         = vault_jwt_auth_backend.terraform.path
  role_name       = "pi_vault"
  token_policies  = ["default", "admin"]
  bound_claims_type = "glob"
  bound_audiences = ["vault.workload.identity"]
  bound_claims = {
    sub = "organization:blinkbyte:project:*:workspace:pi_vault:run_phase:*"
  }
  user_claim      = "terraform_full_workspace"
  role_type       = "jwt"
}