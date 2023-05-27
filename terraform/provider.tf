provider "vault" {
    address = "https://${var.vault_ip}:8200"#"http://${var.vault_url}:8200"
    skip_tls_verify = true
}

provider "aws" {
    region = "eu-west-2"
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "blinkbyte"

    workspaces {
      name = "pi_vault"
    }
  }
}