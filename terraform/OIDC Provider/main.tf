resource "vault_identity_oidc_assignment" "aws" {
  name       = "aws-assignment"
  group_ids  = [var.aws_Group_id]
}

resource "vault_identity_oidc_scope" "scope" {
  name        = "groups"
  template    = "{\"groups\":{{identity.entity.groups.names},\"username\":{{identity.entity.name}}}}"
  description = "Vault OIDC Groups Scope"
}


resource "vault_identity_oidc_client" "aws" {
  name          = "application"
  client_type   = "public"
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

resource "vault_identity_oidc_provider" "aws" {
  name = "aws"
  https_enabled = false
  allowed_client_ids = ["*"]
  scopes_supported = [
    vault_identity_oidc_scope.scope.name
  ]
}