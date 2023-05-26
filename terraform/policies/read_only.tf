resource "vault_policy" "read_only" {
  name = "read_only"
  policy = <<EOT
path "*" {
    capabilities = ["list"]
}
path "sys/policies/acl/*" {
    capabilities = ["list", "read"]
}
path "sys/auth/*" {
    capabilities = ["list", "read"]
}
EOT
}