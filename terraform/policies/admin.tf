resource "vault_policy" "admin" {
  name = "admin"
  policy = <<EOT
path "*" {
    capabilities = ["sudo","create","read","update","patch","delete","list"]
}

EOT
}