


#SV Node Pool
resource "azurerm_kubernetes_cluster_node_pool" "taas-sv-pool" {
  name                  = var.svpool_name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  #kubernetes_cluster_id = azurerm_kubernetes_cluster
  #kubernetes_cluster_id = module.aks-cluster.azurerm_kubernetes_cluster_id
  enable_auto_scaling   = var.svpool_enable_auto_scaling
  orchestrator_version  = var.svpool_orchestrator_version
  vm_size               = var.svpool_vm_size
  min_count             = var.svpool_min_count
  max_count             = var.svpool_max_count
  node_count            = var.svpool_node_count
  max_pods              = var.svpool_max_pods
  mode           = var.svpool_mode

  node_taints           = [
    "product=taas-sv:NoSchedule"
  ]

  tags = {
    "application"="taas"
    "product"="taas-sv"
  }

  node_labels = {
    "application"="taas"
    "product"="taas-sv"
  }

  # --resource-group dt-n-taas-rg 
  # --cluster-name dt-n-taas-aks 
  # --name svpool --enable-cluster-autoscaler 
  # --kubernetes-version 1.18.10 
  # --node-vm-size Standard_D4_v3 
  # --min-count 1 
  # --max-count 2 
  # --max-pods 10 
  # --node-count=1 
  # --tags application=taas product=taas-sv 
  # --labels application=taas product=taas-sv 
  # --node-taints product=taas-sv:NoSchedule 
  # --mode user
}

#PT Node Pool
resource "azurerm_kubernetes_cluster_node_pool" "taas-pt-pool" {
  name                  = var.ptpool_name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  #kubernetes_cluster_id = module.cluster.kubernetes_cluster_id
  #kubernetes_cluster_id = module.aks-cluster.azurerm_kubernetes_cluster_id
  enable_auto_scaling   = var.ptpool_enable_auto_scaling
  orchestrator_version  = var.ptpool_orchestrator_version
  vm_size               = var.ptpool_vm_size
  min_count             = var.ptpool_min_count
  max_count             = var.ptpool_max_count
  node_count            = var.ptpool_node_count
  max_pods              = var.ptpool_max_pods
  mode                  = var.ptpool_mode

  node_taints           = [
    "product=taas-pt:NoSchedule"
  ]

  tags = {
    "application"="taas"
    "product"="taas-pt"
  }

  node_labels = {
    "application"="taas"
    "product"="taas-pt"
  }

  # --resource-group dt-n-taas-rg 
  # --cluster-name dt-n-taas-aks 
  # --name svpool --enable-cluster-autoscaler 
  # --kubernetes-version 1.18.10 
  # --node-vm-size Standard_D8_v3 
  # --min-count 1 
  # --max-count 2 
  # --max-pods 10 
  # --node-count=1 
  # --tags application=taas product=taas-pt 
  # --labels application=taas product=taas-pt 
  # --node-taints product=taas-pt:NoSchedule 
  # --mode user
}


#AT Node Pool
resource "azurerm_kubernetes_cluster_node_pool" "taas-at-pool" {
  name                  = var.atpool_name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  #kubernetes_cluster_id = module.cluster.kubernetes_cluster_id
  # Below gives no module defined
  #kubernetes_cluster_id = module.aks-cluster.azurerm_kubernetes_cluster_id
  enable_auto_scaling   = var.atpool_enable_auto_scaling
  orchestrator_version  = var.atpool_orchestrator_version
  vm_size               = var.atpool_vm_size
  min_count             = var.atpool_min_count
  max_count             = var.atpool_max_count
  node_count            = var.atpool_node_count
  max_pods              = var.atpool_max_pods
  mode                  = var.atpool_mode

  node_taints           = [
    "product=taas-at:NoSchedule"
  ]

  tags = {
    "application"="taas"
    "product"="taas-at"
  }

  node_labels = {
    "application"="taas"
    "product"="taas-at"
  }

  # --resource-group dt-n-taas-rg 
  # --cluster-name dt-n-taas-aks 
  # --name svpool --enable-cluster-autoscaler 
  # --kubernetes-version 1.18.10 
  # --node-vm-size Standard_D4_v3 
  # --min-count 1 
  # --max-count 2 
  # --max-pods 10 
  # --node-count=1 
  # --tags application=taas product=taas-at 
  # --labels application=taas product=taas-at 
  # --node-taints product=taas-at:NoSchedule 
  # --mode user
}