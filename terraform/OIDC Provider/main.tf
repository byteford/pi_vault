resource "vault_identity_oidc_assignment" "aws" {
  name       = "aws-assignment"
  group_ids  = [var.aws_Group_id]
}
resource "vault_identity_oidc_key" "aws" {
  name               = "aws"
  allowed_client_ids = ["*"]
  rotation_period    = 3600
  verification_ttl   = 3600
}
resource "vault_identity_oidc_scope" "user" {
  name        = "user"
  template    = jsonencode({
    username = "{{identity.entity.name}}"
    })
  description = "Vault OIDC Groups Scope"
}

resource "vault_identity_oidc_provider" "aws" {
  name = "aws"
  https_enabled = false
  issuer_host = "127.0.0.1:8200"
  allowed_client_ids = [
    vault_identity_oidc_client.tawsest.client_id
  ]
  scopes_supported = [
    vault_identity_oidc_scope.aws.name
  ]
}

resource "vault_identity_oidc_client" "aws" {
  name          = "application"
  key           = vault_identity_oidc_key.aws.name
  redirect_uris = [
    "http://127.0.0.1:9200/v1/auth-methods/oidc:authenticate:callback",
    "http://127.0.0.1:8251/callback",
    "http://127.0.0.1:8080/callback"
  ]
  assignments = [
    vault_identity_oidc_assignment.aws.name
  ]
  id_token_ttl     = 2400
  access_token_ttl = 7200
}