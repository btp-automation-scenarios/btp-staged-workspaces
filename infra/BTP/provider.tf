
terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "~> 1.9.0"
    }
  }
  backend "azurerm" {
    key      = "btpworkspace.terraform.state"
    use_oidc = true
  }
}

# Please checkout documentation on how best to authenticate against SAP BTP
# via the Terraform provider for SAP BTP
provider "btp" {
  globalaccount = var.globalaccount
}
