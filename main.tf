data "azurerm_private_dns_zone" "cluster_dns_zone" {
  count               = var.private_cluster_enabled == true ? 1 : 0
  name                = var.private_cluster_dns_zone_name
  resource_group_name = var.private_cluster_dns_rg
}


resource "azurerm_kubernetes_cluster" "my_aks_cluster" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  dns_prefix                 = var.private_cluster == false ? "${var.name}-aks" : null
  dns_prefix_private_cluster = var.private_cluster == true ? "${var.name}-aks" : null
  tags                       = var.aks_tags
  default_node_pool {
    temporary_name_for_rotation  = "${var.default_node_pool_name}_rotation"
    name                         = var.default_node_pool_name
    vm_size                      = var.default_node_pool_vm_size
    max_pods                     = var.default_node_pool_max_pods
    pod_subnet_id                = var.aks_subnet_id
    node_labels                  = var.default_node_pool_labels
    os_sku                       = var.default_node_pool_os_sku
    proximity_placement_group_id = var.default_node_pool_proximity_placement_group_id
    vnet_subnet_id               = var.aks_subnet_id
    auto_scaling_enabled         = var.default_node_pool_auto_scaling_enabled
    scale_down_mode              = var.default_node_pool_scale_down_mode
    type                         = var.default_node_pool_type
    tags = merge(
      var.aks_tags,
      var.default_node_pool_tags
    )
    zones      = var.default_node_pool_zones
    max_count  = var.default_node_pool_auto_scaling_enabled == true ? var.default_node_pool_max_count : null
    min_count  = var.default_node_pool_auto_scaling_enabled == true ? var.default_node_pool_min_count : null
    node_count = var.default_node_pool_auto_scaling_enabled == true ? var.default_node_pool_node_count : null
  }
  automatic_upgrade_channel = var.automatic_upgrade_channel

  azure_active_directory_role_based_access_control {
    azure_rbac_enabled = var.azure_rbac_enabled
  }

  azure_policy_enabled = var.azure_policy_enabled

  confidential_computing {
    sgx_quote_helper_enabled = var.confidential_computing_sgx_quote_helper_enabled
  }

  cost_analysis_enabled = var.sku_tier == "Standard" || var.sku_tier == "Premium" ? var.cost_analysis_enabled : false

  dynamic "identity" {
    for_each = var.identity_or_service_principal == "Identity" ? toset([1]) : toset([])
    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" ? [var.user_assigned_identity_id] : null
    }
  }

  dynamic "service_principal" {
    for_each = var.identity_or_service_principal == "ServicePrincipal" ? toset([1]) : toset([])
    content {
      client_id     = var.service_principal_client_id
      client_secret = var.service_principal_client_secret
    }
  }

  sku_tier                = var.sku_tier
  node_resource_group     = var.node_resource_group
  private_cluster_enabled = var.private_cluster_enabled
  private_dns_zone_id     = data.azurerm_private_dns_zone.cluster_dns_zone[0].id


  network_profile {
    network_plugin = var.network_profile_network_plugin
    network_policy = var.network_profile_network_policy
    dns_service_ip = var.network_profile_kube_dns_service_ip
    outbound_type  = var.network_profile_outbound_type
    pod_cidr       = var.network_profile_network_plugin == "kubenet" ? var.network_profile_pod_cidrs : null

  }

  dynamic "bootstrap_profile " {
    for_each = var.container_registry_id != null ? toset([1]) : toset([])
    content {
      container_registry_id = var.container_registry_id
    }
  }

  dynamic "oms_agent" {
    for_each = var.enable_logs_analytics_workspace == true ? toset([1]) : toset([])
    content {
      log_analytics_workspace_id = azurerm_log_analytics_workspace.logs[0].id
    }
  }
}




resource "azurerm_log_analytics_workspace" "logs" {
  count               = var.enable_logs_analytics_workspace == true ? 1 : 0
  name                = var.log_analytics_worspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
}