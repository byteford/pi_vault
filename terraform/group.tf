resource "vault_identity_group" "Admin" {
  name     = "Admin"
  type     = "internal"
  policies = ["admin"]

  metadata = {
    version = "2"
  }
  member_entity_ids = [module.James.entity_id]
}

resource "vault_identity_group" "read_only" {
  name     = "read_only"
  type     = "internal"
  policies = ["read_only"]

  metadata = {
    version = "2"
  }
  member_entity_ids = [module.James.entity_id, module.Wale.entity_id]
}

resource "vault_identity_group" "aws_access" {
  name     = "aws_access"
  type     = "internal"
  policies = []

  metadata = {
    version = "2"
  }
  member_entity_ids = [module.James.entity_id]
}