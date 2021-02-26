# # Get the KeyVault 
# data "azurerm_key_vault" "kv1" {
#   name                = var.key_vault_name
#   resource_group_name = var.resource_group_name
# }

# # Get the Service Principal App ID used for server
# data "azurerm_key_vault_secret" "provider_client_id" {
#   name         = "dt-n-taas-aks-login-sp-app-id"
#   key_vault_id = data.azurerm_key_vault.kv1.id
# }

terraform {
  backend "azurerm" {
    resource_group_name   = "dt-n-taas-rg"
    storage_account_name  = "taasaksstorage"
    container_name        = "tf-state-container"
    key                   = "taasaks.tfstate"
  }
}

provider "azurerm" {
 #version = "~> 2.42.0"

  # subscription_id = "151e8825-89f3-4507-ac30-3ea54ea49f78"
  # client_id       = "700d4f08-93c8-4622-a2ee-5360183ff66b"
  # client_secret   = "ses15qF.zs4~FQ2P5nM9LPX-E~P6E6BKs4"
  # tenant_id       = "49793faf-eb3f-4d99-a0cf-aef7cce79dc1"

  features {}
}

provider "tls" {
  #version = "~> 3.0.0"
}

provider "kubernetes" {}