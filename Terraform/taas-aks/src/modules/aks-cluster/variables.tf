# variable "dt-spoke-taas-prefix" {
#   description = "Prefix to be used which represents the spoke name for taas"
#   default = "dt-n-taas"
# }

variable "key_vault_name" {
  description = "Name of the Key Vault where secrets related to Service Principals are stored"
  default = "dt-n-taas-kv"
}


variable "resource_group_name" {
  description = "name of the resource group to deploy AKS cluster in"
  # default     = "{var.dt-spoke-taas-prefix}-rg"
}


variable "cluster_name" {
  description = "AKS cluster name"
  #default     = "{var.dt-spoke-taas-prefix}-aks"
}
variable "outbound_type" {
  description = "How does traffic go outside"
  default     = "userDefinedRouting"
}


#variable "sp_client_id" {
#variable "login_serviceprincipal_id" {
variable "sp_client_app_id" {
  description = "Service Principal ID"
  #default     = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

}
#variable "sp_client_secret" {
#variable "login_serviceprincipal_secret_id" {
variable "sp_client_app_secret_id" {
  description = "Service Principal Password"
  #default     = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

#Azure Active Directory - ad

variable "ad_server_app_id" {
  description          = "Server Service Principal Application ID"
  #default              = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

# variable ad_server_app_secret {
#   description              = "Server Service Principal Secret"
#   default                  = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
# }

variable "ad_server_app_secret_id" {
  description              = "Server Service Principal Secret"
  #default                  = "8ia.B3nuQ0fm61.wATM_9g_JdcStB8.~K."
}

variable "ad_client_app_id" {
  description              = "Server Client Principal Secret"
  #default                  = "XXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

variable "admin_username" {
  description              = "(Required) The Admin Username for the Cluster. Changing this forces new resource to be created"
  default                  = "taas-aks-admin"
}
variable "dns_prefix" {
  description              = " (Required) DNS prefix specified when creating the managed cluster."
  #default                  = "{var.cluster_name}"
}


variable "location" {
  description = "azure location to deploy resources"
  default     = "eastus"
}

variable "kubernetes_version" {
  description = "version of the kubernetes cluster"
  #default       = "1.18.10"
}

# variable "api_server_authorized_ip_ranges" {
#   description = "ip ranges to lock down access to kubernetes api server"
#   default     = "0.0.0.0/0"
# }



# # Node Pool config
# variable "agent_pool_name" {
#   description = "name for the agent pool profile"
#   default     = "systempool"
# }

# variable "agent_pool_type" {
#   description = "type of the agent pool (AvailabilitySet and VirtualMachineScaleSets)"
#   default     = "AvailabilitySet"
# }

variable "node_count" {
  description = "number of nodes to deploy"
  #default = "1"
}

variable "vm_size" {
  description = "size/type of VM to use for nodes"
  #default = "Standard_D2_v3"
}


# variable "os_disk_size_gb" {
#   description = "size of the OS disk to attach to the nodes"
# }
# variable "taasaks_storage_id" {
#   description = "storage id of the storage for terraform state"
# }

variable "vnet_subnet_id" {
  description = "vnet id where the nodes will be deployed"
  #default = "/subscriptions/151e8825-89f3-4507-ac30-3ea54ea49f78/resourceGroups/ets-p-zeaus-network-rg/providers/Microsoft.Network/virtualNetworks/dt-n-zeaus-10-25-112-0_20-vnet/subnets/dt-n-taas-aks-10.25.117.0_25_snet"
}

variable "max_pods" {
  description = "maximum number of pods that can run on a single node"
}


#Network Profile config
variable "network_plugin" {
  description = "network plugin for kubenretes network overlay (azure or calico)"
  default     = "azure"
}

variable "network_policy" {
  description = "(Optional) Sets up network policy to be used with Azure CNI."
  default     = "calico"
}

variable "service_cidr" {
  description = "kubernetes internal service cidr range"
  default     = "100.127.240.0/20"
}

variable "dns_service_ip" {
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)."
  default     = "100.127.240.10"
}
variable "docker_bridge_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. "
  default     = "100.126.0.1/16"
}


# variable "diagnostics_workspace_id" {
#   description = "log analytics workspace id for cluster audit"
# }

variable "min_count" {
  default     = 1
  description = "Minimum Node Count"
}
variable "max_count" {
  default     = 2
  description = "Maximum Node Count"
}
variable "default_pool_name" {
  description = "name for the agent pool profile"
  default     = "systempool"
}
# variable "default_pool_type" {
#   description = "type of the agent pool (AvailabilitySet and VirtualMachineScaleSets)"
#   default     = "VirtualMachineScaleSets"
# }







