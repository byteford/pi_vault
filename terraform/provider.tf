provider "vault" {
    address = "https://${var.vault_url}:8200"#"http://${var.vault_url}:8200"
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