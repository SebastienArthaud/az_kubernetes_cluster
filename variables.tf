##########################
#        DNS ZONE
##########################
variable "private_cluster_enabled" {
  type        = bool
  description = "Est ce que le cluster sera privé ? Si oui une zone DNS privée devra être spécifiée"
  default     = false
}

variable "private_cluster_dns_zone_name" {
  type        = string
  description = "Nom de la zone DNS privée utilisée si le cluster AKS est privé"
  default     = null
}

variable "private_cluster_dns_rg" {
  type        = string
  description = "Resource group de la zone DNS privée à spécifier si le cluster AKS est privé"
  default     = null
}



##########################
#      AKS CLUSTER
##########################
variable "name" {
  type        = string
  description = "Nom du cluster AKS"
}

variable "location" {
  type        = string
  description = "Région hébergeant le cluster AKS"
  default     = "francecentral"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "private_cluster" {
  type        = bool
  description = "Si passé à 'True', l'api de management du cluster deviendra privé et sera seulement accessible via une connection privée"
  default     = false
}

variable "aks_tags" {
  type        = map(string)
  description = "tags utilisés pour le cluster aks"
  default     = null
}


variable "default_node_pool_name" {
  type        = string
  description = "Nom du node pool systèle créé"
  default     = "agentpool"
}

variable "default_node_pool_vm_size" {
  type        = string
  description = "VM Size des VMs créées dans ce node pool système"
  default     = "Standard_DS2_v2"
}

variable "default_node_pool_auto_scaling_enabled" {
  type        = bool
  description = "la scalabilité du node pool système sera-t-elle automatique ?"
  default     = false
}

variable "default_node_pool_max_pods" {
  type        = number
  description = "Nombre de pod qui peuvent tourner sur chaque node du node pool"
  default     = null
}

variable "aks_subnet_id" {
  type        = string
  description = "ID du subnet ou le cluster sera déployé"

}

variable "default_node_pool_labels" {
  type        = map(string)
  description = "labels à ajouter au niveau des nodes dans le cluster"
  default     = null
}


variable "default_node_pool_os_sku" {
  type        = string
  description = "Specifies the OS SKU used by the agent pool. Possible values are AzureLinux, Ubuntu, Windows2019 and Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. Changing this from AzureLinux or Ubuntu to AzureLinux or Ubuntu will not replace the resource, otherwise temporary_name_for_rotation must be specified when attempting a change."
  default     = "ubuntu"
}

variable "default_node_pool_proximity_placement_group_id" {
  type        = string
  description = "The ID of the Proximity Placement Group. Changing this forces a new resource to be created."
  default     = null
}


variable "default_node_pool_scale_down_mode" {
  type        = string
  description = "Specifies the autoscaling behaviour of the Kubernetes Cluster. Allowed values are Delete and Deallocate."
  default     = "Delete"
}

variable "default_node_pool_type" {
  type        = string
  description = "The type of Node Pool which should be created. Possible values are VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets. Changing this forces a new resource to be created."
  default     = "VirtualMachineScaleSets"
}

variable "default_node_pool_tags" {
  type        = map(string)
  description = "tags utilisés pour le node pool système"
  default     = null
}

variable "default_node_pool_zones" {
  type = list(string)
  description = "Specifies a list of Availability Zones in which this Kubernetes Cluster should be located. temporary_name_for_rotation must be specified when changing this property."
  default = null
}

variable "default_node_pool_max_count" {
  type = number
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default = null
}

variable "default_node_pool_min_count" {
  type = number
  description = "The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default = null
}

variable "default_node_pool_node_count" {
  type = number
  description = "The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default = null
}

variable "automatic_upgrade_channel" {
  type = string
  description = "imageandstable. Omitting this field sets this value to none`.!> Note: Cluster Auto-Upgrade will update the Kubernetes Cluster (and its Node Pools) to the latest GA version of Kubernetes automatically - please see 'https://learn.microsoft.com/en-us/azure/aks/upgrade-cluster#set-auto-upgrade-channel' for more information."
  default = "node-image"
}

variable "azure_rbac_enabled" {
  type = bool
  description = "Is Role Based Access Control based on Azure AD enabled?"
  default = true
}

variable "azure_policy_enabled" {
  type = bool
  description = "Enhance your AKS cluster governance by installin the azure policy extension on your cluster allowing the azure policy to check your cluster, pods and nodes compliance"
  default = false
}

variable "confidential_computing_sgx_quote_helper_enabled" {
  type = bool
  description = "Should the SGX quote helper be enabled?"
  default = false
}

variable "cost_analysis_enabled" {
  type = bool
  description = "Should cost analysis be enabled for this Kubernetes Cluster? Defaults to false. The sku_tier must be set to Standard or Premium to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal."
  default = false
}

variable "sku_tier" {
  type = string
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free."
  default = "Free"
}

variable "identity_or_service_principal" {
  type = string
  description = <<DESCRIPTION
  Will this cluster use an Identoty entity to be able to access other azure resources or a service principal ?"

  Can be ServicePrincipal or Identity
  DESCRIPTION

  default = "Identity"
}

variable "identity_type" {
  type        = string
  description = "Type identité à activer sur la ressource ('UserAssigned' et 'SystemAssigned' sont les eules valeurs autorisées)"
  default     = "SystemAssigned"
}

variable "user_assigned_identity_id" {
  type        = string
  description = "ID de l'UAI si la variable 'identity_type' est égal à 'UserAssigned'"
  default = null
}


variable "service_principal_client_id" {
  type = string
  description = "Client ID du SPN utilisé si la variable 'identity_or_service_principal' est défini sur 'ServicePrincipal'"
  default = null
}

variable "service_principal_client_secret" {
  type = string
  description = "Secret du SPN utilisé si la variable 'identity_or_service_principal' est défini sur 'ServicePrincipal'"
  default = null
}

variable "node_resource_group" {
  type = string
  description = "The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created."
  default = null
}

variable "network_profile_network_plugin" {
  type = string
  description = "Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created"
  default = "azure"
}

variable "network_profile_network_policy" {
  type = string
  description = <<DESCRIPTION
  Sets up network policy to be used with Azure CNI. 
  Network policy allows us to control the traffic flow between pods. Currently supported values are calico, azure and cilium.

  NOTE : When network_policy is set to azure, the network_plugin field can only be set to azure.
  DESCRIPTION

  default = "azure"
}

variable "network_profile_kube_dns_service_ip" {
  type = string
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)"
  default = null
}

variable "network_profile_outbound_type" {
  type = string
  description = "The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer, userDefinedRouting, managedNATGateway, userAssignedNATGateway and none"
  default = "loadBalancer"
}

variable "container_registry_id" {
  type = string
  description = <<DESCRIPTION
  The resource Id of Azure Container Registry.

  NOTE :
  The container_registry_id requires an ACR with a private link to the cluster. 
  You must manage permissions, cache rules, the associated private link and the private endpoint. 
  Please see the product documentation for more information on configuring an ACR with a private endpoint.

  DESCRIPTION
}


variable "enable_logs_analytics_workspace" {
  type = bool
  description = "Enables or not the Kubernetes cluster logs gathering into a Log analytics workspace"
  default = false
}


variable "log_analytics_worspace_name" {
  type = string
  description = <<DESCRIPTION
  Name of the log analytics workspace if the variable 'enable_logs_analytics_workspace' is set to true

  NOTE:
  63 letters, digits or '-'. 
  The '-' shouldn't be the first or the last symbol. 
  Changing this forces a new resource to be created.
  DESCRIPTION

}
##########################
# LOG ANALYTICS WORSPACE #
##########################