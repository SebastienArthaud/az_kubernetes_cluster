resource "azurerm_kubernetes_cluster_node_pool" "my_aks_node_pool" {
  kubernetes_cluster_id         = var.kubernetes_cluster_id
  name                          = var.pool_name
  temporary_name_for_rotation   = "${var.pool_name}_rotation"
  vm_size                       = var.pool_vm_size
  capacity_reservation_group_id = var.pool_capacity_reservation_group_id
  auto_scaling_enabled          = var.pool_auto_scaling_enabled
  max_count                     = var.pool_auto_scaling_enabled == true ? var.pool_max_count : null
  min_count                     = var.pool_auto_scaling_enabled == true ? var.pool_min_count : null
  node_count                    = var.pool_auto_scaling_enabled == true ? var.pool_node_count : null
  host_encryption_enabled       = var.pool_host_encryption_enabled
  node_public_ip_enabled        = var.pool_node_public_ip_enabled
  node_public_ip_prefix_id      = var.pool_node_public_ip_prefix_id
  eviction_policy               = var.pool_eviction_policy
  host_group_id                 = var.pool_host_group_id
  kubelet_disk_type             = var.pool_kubelet_disk_type
  max_pods                      = var.pool_max_pods
  mode                          = var.pool_mode
  node_labels                   = var.pool_labels
  node_taints                   = var.pool_node_taints
  orchestrator_version          = var.pool_orchestrator_version
  os_disk_size_gb               = var.pool_os_disk_size_gb
  os_disk_type                  = var.pool_os_disk_type
  pod_subnet_id                 = var.pool_pod_subnet_id
  os_sku                        = var.pool_os_sku
  os_type                       = var.pool_os_type
  zones                         = var.pool_zones
  priority                      = var.pool_priority
  proximity_placement_group_id  = var.pool_proximity_placement_group_id
  tags                          = var.pool_tags
  scale_down_mode               = var.pool_scale_down_mode
  vnet_subnet_id                = var.pool_subnet_id

  dynamic "windows_profile" {
    for_each = var.pool_os_type == "Windows" ? toset([1]) : toset([])
    content {
      outbound_nat_enabled = var.pool_outbound_nat_enabled
    }
  }

}