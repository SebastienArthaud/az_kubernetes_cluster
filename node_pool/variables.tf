##########################
#      AKS CLUSTER
##########################
variable "kubernetes_cluster_id" {
  type        = string
  description = "ID du cluster AKS ou ce node pool sera attaché"
}

variable "pool_tags" {
  type        = map(string)
  description = "tags utilisés pour le cluster aks"
  default     = null
}

variable "pool_name" {
  type        = string
  description = "Nom du node pool systèle créé"
  default     = "agentpool"
}

variable "pool_vm_size" {
  type        = string
  description = "VM Size des VMs créées dans ce node pool système"
  default     = "Standard_DS2_v2"
}

variable "pool_capacity_reservation_group_id" {
  type        = string
  description = "Specifies the ID of the Capacity Reservation Group where this Node Pool should exist. Changing this forces a new resource to be created."
  default     = null
}

variable "pool_auto_scaling_enabled" {
  type        = bool
  description = "la scalabilité du node pool système sera-t-elle automatique ?"
  default     = false
}

variable "pool_host_encryption_enabled" {
  type        = bool
  description = "Should the nodes in this Node Pool have host encryption enabled? Changing this property requires specifying temporary_name_for_rotation."
  default     = false
}

variable "pool_node_public_ip_enabled" {
  type        = bool
  description = "Should each node have a Public IP Address? Changing this property requires specifying temporary_name_for_rotation."
  default     = false
}

variable "pool_node_public_ip_prefix_id" {
  type        = string
  description = "Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool. node_public_ip_enabled should be true. Changing this forces a new resource to be created."
  default     = null
}

variable "pool_eviction_policy" {
  type        = string
  description = "The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
  default     = null
}

variable "pool_host_group_id" {
  type        = string
  description = "The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from. Changing this forces a new resource to be created."
  default     = null
}

variable "pool_kubelet_disk_type" {
  type        = string
  description = "The type of disk used by kubelet. Possible values are OS and Temporary. Changing this property requires specifying temporary_name_for_rotation."
  default     = null
}

variable "pool_mode" {
  type        = string
  description = "Should this Node Pool be used for System or User resources? Possible values are System and User. Defaults to User."
  default     = "User"
}


variable "pool_max_pods" {
  type        = number
  description = "Nombre de pod qui peuvent tourner sur chaque node du node pool"
  default     = null
}

variable "pool_subnet_id" {
  type        = string
  description = "ID du subnet ou le default node pool sera déployé"

}

variable "pool_pod_subnet_id" {
  type        = string
  description = "ID du subnet ou les pods du default node pool sera déployé"
}

variable "pool_labels" {
  type        = map(string)
  description = "labels à ajouter au niveau des nodes dans le cluster"
  default     = null
}


variable "pool_os_sku" {
  type        = string
  description = "Specifies the OS SKU used by the agent pool. Possible values are AzureLinux, Ubuntu, Windows2019 and Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. Changing this from AzureLinux or Ubuntu to AzureLinux or Ubuntu will not replace the resource, otherwise temporary_name_for_rotation must be specified when attempting a change."
  default     = "ubuntu"
}

variable "pool_proximity_placement_group_id" {
  type        = string
  description = "The ID of the Proximity Placement Group. Changing this forces a new resource to be created."
  default     = null
}


variable "pool_scale_down_mode" {
  type        = string
  description = "Specifies the autoscaling behaviour of the Kubernetes Cluster. Allowed values are Delete and Deallocate."
  default     = "Delete"
}

variable "pool_tags" {
  type        = map(string)
  description = "tags utilisés pour le node pool système"
  default     = null
}

variable "pool_zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Kubernetes Cluster should be located. temporary_name_for_rotation must be specified when changing this property."
  default     = null
}

variable "pool_max_count" {
  type        = number
  description = "The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default     = null
}

variable "pool_min_count" {
  type        = number
  description = "The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default     = null
}

variable "pool_node_count" {
  type        = number
  description = "The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
  default     = null
}
