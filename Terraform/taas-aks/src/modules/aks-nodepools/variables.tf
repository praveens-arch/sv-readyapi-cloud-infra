
variable "kubernetes_cluster_id" {
  description = "Cluster Id of Kubernetes Cluster"
  #default     = "/subscriptions/151e8825-89f3-4507-ac30-3ea54ea49f78/resourcegroups/dt-n-taas-rg/providers/Microsoft.ContainerService/managedClusters/dt-n-taas-aks"
}

variable "svpool_name" {
  description = "Name of the SV Node pool"
  default     = "svpool"
}


variable "svpool_enable_auto_scaling" {
  description = "Is the autoscale turned on"
  default     = true
}

variable "svpool_orchestrator_version" {
  description = "Kubernetes Version"
  default     = "1.18.10"
}

variable "svpool_vm_size" {
  description = "Class of VM"
  default     = "Standard_D4_v3"
}

variable "svpool_min_count" {
  description = "Min Node Couunt"
  default     = "1"
}

variable "svpool_max_count" {
  description = "Max Node Couunt"
  default     = "2"
}

variable "svpool_node_count" {
  description = "Initial Node Couunt"
  default     = "1"
}

variable "svpool_max_pods" {
  description = "Max Pods Per Node"
  default     = "10"
}

variable "svpool_mode" {
  description = "Type of Node Pool"
  default     = "User"
}

# PT Pool variables
variable "ptpool_name" {
  description = "Name of the SV Node pool"
  default     = "ptpool"
}


variable "ptpool_enable_auto_scaling" {
  description = "Is the autoscale turned on"
  default     = true
}

variable "ptpool_orchestrator_version" {
  description = "Kubernetes Version"
  default     = "1.18.10"
}

variable "ptpool_vm_size" {
  description = "Class of VM"
  default     = "Standard_D8_v3"
}

variable "ptpool_min_count" {
  description = "Min Node Couunt"
  default     = "1"
}

variable "ptpool_max_count" {
  description = "Max Node Couunt"
  default     = "2"
}

variable "ptpool_node_count" {
  description = "Initial Node Couunt"
  default     = "1"
}

variable "ptpool_max_pods" {
  description = "Max Pods Per Node"
  default     = "10"
}

variable "ptpool_mode" {
  description = "Type of Node Pool"
  default     = "User"
}

# Automation Node Pool variables
variable "atpool_name" {
  description = "Name of the SV Node pool"
  default     = "atpool"
}


variable "atpool_enable_auto_scaling" {
  description = "Is the autoscale turned on"
  default     = true
}

variable "atpool_orchestrator_version" {
  description = "Kubernetes Version"
  default     = "1.18.10"
}

variable "atpool_vm_size" {
  description = "Class of VM"
  default     = "Standard_D4_v3"
}

variable "atpool_min_count" {
  description = "Min Node Couunt"
  default     = "1"
}

variable "atpool_max_count" {
  description = "Max Node Couunt"
  default     = "2"
}

variable "atpool_node_count" {
  description = "Initial Node Couunt"
  default     = "1"
}

variable "atpool_max_pods" {
  description = "Max Pods Per Node"
  default     = "10"
}

variable "atpool_mode" {
  description = "Type of Node Pool"
  default     = "User"
}