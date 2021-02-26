

variable "key_vault_name" {
  description = "Name of the Key Vault where secrets related to Service Principals are stored"
  default = "dt-n-taas-kv"
}

variable "log_analytics_workspace_location" {
  description = "Log Analytics Location"
  default     = "eastus"
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  default     = "taas-loganalytics"
}

variable "log_analytics_workspace_sku" {
  description = "Log Analytics sku"
  default     = "PerGB2018"
}
variable "dt-spoke-taas-prefix" {
  description = "Prefix to be used which represents the spoke name for taas"
  default = "dt-n-taas"
}
variable "node_count" {
  description = "number of nodes to deploy"
  default     = 1
}

# variable "k8_mod_cluster_id" {
#   description = "Kubernetes cluster id  from aks-aluctser"
# }

variable dns_prefix {
  description              = " (Required) DNS prefix specified when creating the managed cluster."
  default                  = "dt-n-taas-aks"
}

variable "cluster_name" {
  description = "AKS cluster name"
  #default     = "${var.dt-spoke-taas-prefix}-aks"
  default      = "dt-n-taas-aks"
}

# variable "k8_cluster_id" {
#   description = "Kubenretes Cluster ID"
# }

variable "resource_group_name" {
  description = "name of the resource group to deploy AKS cluster in"
  #default     = "${var.dt-spoke-taas-prefix}-rg"
  default      = "dt-n-taas-rg"
}

variable location {
  description = "azure location to deploy resources"
  default     = "eastus"
}

variable "vm_size" {
  description = "size/type of VM to use for nodes"
  default = "Standard_D2_v3"
}

variable "vnet_subnet_id" {
  description = "vnet id where the nodes will be deployed"
  default = "/subscriptions/151e8825-89f3-4507-ac30-3ea54ea49f78/resourceGroups/ets-p-zeaus-network-rg/providers/Microsoft.Network/virtualNetworks/dt-n-zeaus-10-25-112-0_20-vnet/subnets/dt-n-taas-aks-10.25.117.0_25_snet"
}


# variable log_analytics_workspace_name {
#   default = "testLogAnalyticsWorkspaceName"
# }

# # refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
# variable log_analytics_workspace_location {
#   default = "eastus"
# }

# # refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing
# variable log_analytics_workspace_sku {
#   default = "PerGB2018"
# }

# variable subnet_name {
#   description = "subnet id where the nodes will be deployed"
#   # default     = "runitoncloud-subnet"
# }

# variable vnet_name {
#   description = "vnet id where the nodes will be deployed"
#   # default     = "runitoncloud-vnet"
# }

# variable subnet_cidr {
#   description = "the subnet cidr range"
#   default     = "10.2.32.0/21"
# }

variable kubernetes_version {
  description = "version of the kubernetes cluster"
  default     = "1.18.10"
}

# variable "vm_size" {
#   description = "size/type of VM to use for nodes"
#   default     = "Standard_D2_v2"
# }

# variable "os_disk_size_gb" {
#   description = "size of the OS disk to attach to the nodes"
#   default     = 512
# }

variable "max_pods" {
  description = "maximum number of pods that can run on a single node"
  default     = "50"
}

variable "min_count" {
  default     = 1
  description = "Minimum Node Count"
}
variable "max_count" {
  default     = 2
  description = "Maximum Node Count"
}