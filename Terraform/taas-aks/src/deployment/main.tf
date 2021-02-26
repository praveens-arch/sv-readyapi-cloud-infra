# # # AKS Stoage Account
# resource "azurerm_storage_account" "taasaksstorage" {
#   name                     = "taasaksstorage2"
#   resource_group_name      = "dt-n-taas-rg"
#   location                 = "eastus"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"

#   tags = {
#     environment = "test"
#   }
# }

# resource "azurerm_storage_container" "tf-state-container" {
#   name                  = "tf-state-container"
#   storage_account_name  = "taasaksstorage2"
#   container_access_type = "private"
# }

resource "azurerm_log_analytics_workspace" "loganalytics" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = var.log_analytics_workspace_name
    location            = var.log_analytics_workspace_location
    resource_group_name = var.resource_group_name
    sku                 = var.log_analytics_workspace_sku
}

# resource "azurerm_log_analytics_solution" "test" {
#     solution_name         = "ContainerInsights"
#     location              = azurerm_log_analytics_workspace.test.location
#     resource_group_name   = var.resource_group_name
#     workspace_resource_id = azurerm_log_analytics_workspace.test.id
#     workspace_name        = azurerm_log_analytics_workspace.test.name

#     plan {
#         publisher = "Microsoft"
#         product   = "OMSGallery/ContainerInsights"
#     }
# }
# AKS Cluster

module "aks-cluster" {
  source                    = "../modules/aks-cluster"
  cluster_name              = var.cluster_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  dns_prefix                = var.dns_prefix
  kubernetes_version        = var.kubernetes_version
  node_count                = var.node_count
  min_count                 = var.min_count
  max_count                 = var.max_count
  #os_disk_size_gb          = "1028"
  max_pods                 = var.max_pods
  vm_size                   = var.vm_size
  vnet_subnet_id            = var.vnet_subnet_id
  #taasaks_storage_id        = azurerm_storage_account.taasaksstorage.id
  ###################
  sp_client_app_id = "dt-n-taas-aksserver-sp-app-id"
  sp_client_app_secret_id = "dt-n-taas-aksserver-sp-password"
  ad_server_app_id = "dt-n-taas-aksserver-sp-app-id"
  ad_server_app_secret_id = "dt-n-taas-aksserver-sp-password"
  ad_client_app_id = "dt-n-taas-aksclient-sp-app-id"
  #key_vault_id = data.azurerm_key_vault.kv.id
  
  
  ####################
  
  # client_id                = module.aks_identities.cluster_client_id
  # client_secret            = module.aks_identities.cluster_sp_secret
  # diagnostics_workspace_id = module.log_analytics.azurerm_log_analytics_workspace

  #================================================================================================================
  ## Handled In                                                                  Default    |   Main   |    Module |
  #=================================================================================================================        
  ## Indicate the CLI command equivalents for the same
  # --resource-group dt-n-taas-rg                                                                 X
  # --name dt-n-taas-aks                                                                          X 
  # --outbound-type "userDefinedRouting"                                            X
  # --service-principal "XXXXXXXXXXXXXXXXXXXXXXX"                                                 X
  # --client-secret "XXXXXXXXXXXXXXXXXXXXX"                                                       X
  # --generate-ssh-keys                                                             X
  # --aad-server-app-id "XXXXXXXXXXXXXXXXXXXXXXX"                                                 X
  # --aad-server-app-secret "XXXXXXXXXXXXXXXXXXXXX"                                               X
  # --aad-client-app-id "XXXXXXXXXXXXXXXXXXXXXXX"                                                 X
  # --admin-username taas-aks-admin                                                                            X
  # --dns-name-prefix dt-n-taas-aks                                                               X
  # --network-plugin azure                                                                                     X
  # --network-policy calico                                                                                    X
  # --service-cidr 100.127.240.0/20                                                                            X
  # --dns-service-ip 100.127.240.10                                                                            X
  # --docker-bridge-address 100.126.0.1/16                                                                     X
  # --location eastus                                                                             X
  # --kubernetes-version 1.18.10                                                                  X
  # --node-vm-size Standard_D2_v3                                                                 X
  # --nodepool-name systempool                                                                                 X
  # --min-count 1                                                                                 X
  # --max-count 2                                                                                 X
  # --nodepool-tags application=taas                                                                           X
  # --tags product=taas-system                                                                                 X
  # --nodepool-labels application=taas product=taas-system                                                     X
  # --enable-cluster-autoscaler                                                                                X
  # --vnet-subnet-id XXX                                                                          X
  # --node-count 1                                                                                X
  # ========================================================================================================================
    depends_on = [
      azurerm_log_analytics_workspace.loganalytics,
    ]
}

# output "host" {
#   value = azurerm_kubernetes_cluster.cluster.kube_config.0.host
# }

module "aks-nodepools" {
  source                   = "../modules/aks-nodepools"
  # depends_on = [ aks-cluster.kubernetes_cluster_id ]
  kubernetes_cluster_id = module.aks-cluster.azurerm_kubernetes_cluster_id
}

# module "taas-aks-namespaces" {
#   source                   = "../modules/aks-namespaces"
#   depends_on = [
#       module.aks-nodepools,
#     ]
# }

