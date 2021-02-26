# Created by praveen.sankuratri@aa.com
# This module will create the Azure Kubernetes Cluster with default node pool
# Other node pools required are handled byaks-nodepools module

###### Gather Data from keyvault #################
# Get the KeyVault 
data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

# Get the Service Principal App ID used for server
data "azurerm_key_vault_secret" "sp_client_app_id" {
  name         = var.sp_client_app_id
  key_vault_id = data.azurerm_key_vault.kv.id
}


# Get the Service Principal ID secret used for server
data "azurerm_key_vault_secret" "sp_client_app_secret_id" {
  name                = var.sp_client_app_secret_id
  key_vault_id        = data.azurerm_key_vault.kv.id
}

# Get the AD Server App Id
data "azurerm_key_vault_secret" "ad_server_app_id" {
  name         = var.ad_server_app_id
  key_vault_id = data.azurerm_key_vault.kv.id
}

# Get the AD Server App Id Secret
data "azurerm_key_vault_secret" "ad_server_app_secret_id" {
  name         = var.ad_server_app_secret_id
  key_vault_id = data.azurerm_key_vault.kv.id
}

# Get the AD Client App Id
data "azurerm_key_vault_secret" "ad_client_app_id" {
  name         = var.ad_client_app_id
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "sp_login_app_id" {
  name         = "dt-n-taas-aks-login-sp-app-id"
  key_vault_id = data.azurerm_key_vault.kv.id
}


# Get the Service Principal ID secret used for server
data "azurerm_key_vault_secret" "sp_login_app_secret_id" {
  name                = "dt-n-taas-aks-login-sp-password"
  key_vault_id        = data.azurerm_key_vault.kv.id
}
############# Create required resources ###############




resource "azurerm_kubernetes_cluster" "cluster" {

  ## Indicate the CLI command equivalents for the same
  # --resource-group dt-n-taas-rg 
  # --name dt-n-taas-aks 
  # --outbound-type "userDefinedRouting" 
  # --service-principal "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
  # --client-secret "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
  # --generate-ssh-keys 
  # --aad-server-app-id "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
  # --aad-server-app-secret "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  # --aad-client-app-id "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
  # --admin-username taas-aks-admin 
  # --dns-name-prefix dt-n-taas-aks 
  # --network-plugin azure 
  # --network-policy calico 
  # --service-cidr 100.127.240.0/20 
  # --dns-service-ip 100.127.240.10 
  # --docker-bridge-address 100.126.0.1/16 
  # --location eastus 
  # --kubernetes-version 1.18.10 
  # --node-vm-size Standard_D2_v3 
  # --nodepool-name systempool 
  # --min-count 1 --max-count 2 
  # --nodepool-tags application=taas --tags product=taas-system 
  # --nodepool-labels application=taas product=taas-system 
  # --enable-cluster-autoscaler 
  # --vnet-subnet-id /subscriptions/151e8825-89f3-4507-ac30-3ea54ea49f78/resourceGroups/ets-p-zeaus-network-rg/providers/Microsoft.Network/virtualNetworks/dt-n-zeaus-10-25-112-0_20-vnet/subnets/dt-n-taas-aks-10.25.117.0_25_snet 
  # --node-count 1

  name                = var.cluster_name
  resource_group_name = var.resource_group_name
#  taasaks_storage_id = var.taasaks_storage_id

  # Missing Service Principla
  # Missing Client Secret
  # Missing generate ssh keys
  service_principal {
    client_id       = data.azurerm_key_vault_secret.sp_client_app_id.value
    client_secret   = data.azurerm_key_vault_secret.sp_client_app_secret_id.value
  }
  role_based_access_control {
    enabled = true
    azure_active_directory {
      managed            = false
      server_app_id      = data.azurerm_key_vault_secret.ad_server_app_id.value
      server_app_secret     = data.azurerm_key_vault_secret.ad_server_app_secret_id.value
      client_app_id      = data.azurerm_key_vault_secret.ad_client_app_id.value
    }
  }

  linux_profile {
    admin_username = var.admin_username
    ## SSH key is generated using "tls_private_key" resource
    ssh_key {
      key_data = "${trimspace(tls_private_key.key.public_key_openssh)} praveen.sankuratri@aa.com"
    }
  }
  
  addon_profile {
    aci_connector_linux {
      enabled = true
      subnet_name = "dt-n-taas-aks-10.25.117.128_28_snet"
    }

  }

  dns_prefix          = var.dns_prefix

  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = "calico"
    service_cidr       = var.service_cidr
    dns_service_ip     = "100.127.240.10"
    docker_bridge_cidr = "100.126.0.1/16"
    outbound_type       = var.outbound_type
  }

  location            = var.location
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = var.default_pool_name
    node_count      = var.node_count
    vm_size         = var.vm_size
    #os_disk_size_gb = var.os_disk_size_gb
    vnet_subnet_id  = var.vnet_subnet_id
    max_pods        = var.max_pods
    #type            = var.default_pool_type

    enable_auto_scaling = true
    min_count           = var.min_count
    max_count           = var.max_count

    tags = merge(
    {
       "application" = "taas"
    },
    {
      "product" = "True"
    },
  )
  }

 tags = {
        product = "taas-system"
    }

  lifecycle {
    prevent_destroy = true
  }
}

## Private key for the kubernetes cluster ##
resource "tls_private_key" "key" {
  algorithm   = "RSA"
}



