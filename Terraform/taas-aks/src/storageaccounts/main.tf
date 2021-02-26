
provider "azurerm" {
    features {}
}

resource "azurerm_storage_account" "taasaksstorage" {
  name                     = "taasaksstorage"
  resource_group_name      = "dt-n-taas-rg"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_account" "taasaksstorage3" {
  name                     = "taasaksstorage3"
  resource_group_name      = "dt-n-taas-rg"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}


resource "azurerm_storage_container" "tf-state-container3" {
  name                  = "tf-state-container"
  storage_account_name  = "taasaksstorage3"
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.taasaksstorage3,
  ]
}

resource "azurerm_storage_container" "tf-state-container" {
  name                  = "tf-state-container"
  storage_account_name  = "taasaksstorage"
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.taasaksstorage,
  ]
}

# data "azurerm_storage_account_sas" "taasaksstorage2sas" {
#   connection_string = azurerm_storage_account.taasaksstorage2.primary_connection_string
#   https_only        = true
#   signed_version    = "2021-01-15"

#   resource_types {
#     service   = true
#     container = false
#     object    = false
#   }

#   services {
#     blob  = true
#     queue = false
#     table = false
#     file  = false
#   }

#   start  = "2021-01-16"
#   expiry = "2021-01-21"

#   permissions {
#     read    = true
#     write   = true
#     delete  = false
#     list    = true
#     add     = true
#     create  = true
#     update  = false
#     process = false
#   }
# }

# output "sas_url_query_string" {
#   value = data.azurerm_storage_account_sas.taasaksstorage2sas.sas
# }

# output "sas_connection_string" {
#   value = data.azurerm_storage_account_sas.taasaksstorage2sas.connection_string
# }

# output "sas_connection_string_protocol" {
#   value = data.azurerm_storage_account_sas.taasaksstorage2sas.resource_types[0].service
# }
