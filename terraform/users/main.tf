resource "vault_github_user" "user" {
  backend  = var.vault_github_auth_backend.id
  user     = var.github_username
  policies = []
}

resource "vault_identity_entity" "user" {
  name      = var.users_name
  policies  = []
}

resource "vault_identity_entity_alias" "user" {
  name            = "${var.github_username}"
  mount_accessor  = var.vault_github_auth_backend.accessor
  canonical_id    = vault_identity_entity.user.id
}

resource "vault_identity_entity_alias" "google_user" {
  count = var.google_email == "" ? 0:1
  name            = "${var.google_email}"
  mount_accessor  = var.google_auth_backend.accessor
  canonical_id    = vault_identity_entity.user.id
}