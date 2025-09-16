# Az Kubernetes Service

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.11, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.11, < 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.my_aks_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_log_analytics_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_private_dns_zone.cluster_dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_subnet_id"></a> [aks\_subnet\_id](#input\_aks\_subnet\_id) | ID du subnet ou le cluster sera déployé | `string` | n/a | yes |
| <a name="input_container_registry_id"></a> [container\_registry\_id](#input\_container\_registry\_id) | The resource Id of Azure Container Registry.<br/><br/>  NOTE :<br/>  The container\_registry\_id requires an ACR with a private link to the cluster. <br/>  You must manage permissions, cache rules, the associated private link and the private endpoint. <br/>  Please see the product documentation for more information on configuring an ACR with a private endpoint. | `string` | n/a | yes |
| <a name="input_log_analytics_worspace_name"></a> [log\_analytics\_worspace\_name](#input\_log\_analytics\_worspace\_name) | Name of the log analytics workspace if the variable 'enable\_logs\_analytics\_workspace' is set to true<br/><br/>  NOTE:<br/>  63 letters, digits or '-'. <br/>  The '-' shouldn't be the first or the last symbol. <br/>  Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Nom du cluster AKS | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name | `string` | n/a | yes |
| <a name="input_aks_tags"></a> [aks\_tags](#input\_aks\_tags) | tags utilisés pour le cluster aks | `map(string)` | `null` | no |
| <a name="input_automatic_upgrade_channel"></a> [automatic\_upgrade\_channel](#input\_automatic\_upgrade\_channel) | imageandstable. Omitting this field sets this value to none`.!> Note: Cluster Auto-Upgrade will update the Kubernetes Cluster (and its Node Pools) to the latest GA version of Kubernetes automatically - please see 'https://learn.microsoft.com/en-us/azure/aks/upgrade-cluster#set-auto-upgrade-channel' for more information.` | `string` | `"node-image"` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Enhance your AKS cluster governance by installin the azure policy extension on your cluster allowing the azure policy to check your cluster, pods and nodes compliance | `bool` | `false` | no |
| <a name="input_azure_rbac_enabled"></a> [azure\_rbac\_enabled](#input\_azure\_rbac\_enabled) | Is Role Based Access Control based on Azure AD enabled? | `bool` | `true` | no |
| <a name="input_confidential_computing_sgx_quote_helper_enabled"></a> [confidential\_computing\_sgx\_quote\_helper\_enabled](#input\_confidential\_computing\_sgx\_quote\_helper\_enabled) | Should the SGX quote helper be enabled? | `bool` | `false` | no |
| <a name="input_cost_analysis_enabled"></a> [cost\_analysis\_enabled](#input\_cost\_analysis\_enabled) | Should cost analysis be enabled for this Kubernetes Cluster? Defaults to false. The sku\_tier must be set to Standard or Premium to enable this feature. Enabling this will add Kubernetes Namespace and Deployment details to the Cost Analysis views in the Azure portal. | `bool` | `false` | no |
| <a name="input_default_node_pool_auto_scaling_enabled"></a> [default\_node\_pool\_auto\_scaling\_enabled](#input\_default\_node\_pool\_auto\_scaling\_enabled) | la scalabilité du node pool système sera-t-elle automatique ? | `bool` | `false` | no |
| <a name="input_default_node_pool_labels"></a> [default\_node\_pool\_labels](#input\_default\_node\_pool\_labels) | labels à ajouter au niveau des nodes dans le cluster | `map(string)` | `null` | no |
| <a name="input_default_node_pool_max_count"></a> [default\_node\_pool\_max\_count](#input\_default\_node\_pool\_max\_count) | The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. | `number` | `null` | no |
| <a name="input_default_node_pool_max_pods"></a> [default\_node\_pool\_max\_pods](#input\_default\_node\_pool\_max\_pods) | Nombre de pod qui peuvent tourner sur chaque node du node pool | `number` | `null` | no |
| <a name="input_default_node_pool_min_count"></a> [default\_node\_pool\_min\_count](#input\_default\_node\_pool\_min\_count) | The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. | `number` | `null` | no |
| <a name="input_default_node_pool_name"></a> [default\_node\_pool\_name](#input\_default\_node\_pool\_name) | Nom du node pool systèle créé | `string` | `"agentpool"` | no |
| <a name="input_default_node_pool_node_count"></a> [default\_node\_pool\_node\_count](#input\_default\_node\_pool\_node\_count) | The initial number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000. | `number` | `null` | no |
| <a name="input_default_node_pool_os_sku"></a> [default\_node\_pool\_os\_sku](#input\_default\_node\_pool\_os\_sku) | Specifies the OS SKU used by the agent pool. Possible values are AzureLinux, Ubuntu, Windows2019 and Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. Changing this from AzureLinux or Ubuntu to AzureLinux or Ubuntu will not replace the resource, otherwise temporary\_name\_for\_rotation must be specified when attempting a change. | `string` | `"ubuntu"` | no |
| <a name="input_default_node_pool_proximity_placement_group_id"></a> [default\_node\_pool\_proximity\_placement\_group\_id](#input\_default\_node\_pool\_proximity\_placement\_group\_id) | The ID of the Proximity Placement Group. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_default_node_pool_scale_down_mode"></a> [default\_node\_pool\_scale\_down\_mode](#input\_default\_node\_pool\_scale\_down\_mode) | Specifies the autoscaling behaviour of the Kubernetes Cluster. Allowed values are Delete and Deallocate. | `string` | `"Delete"` | no |
| <a name="input_default_node_pool_tags"></a> [default\_node\_pool\_tags](#input\_default\_node\_pool\_tags) | tags utilisés pour le node pool système | `map(string)` | `null` | no |
| <a name="input_default_node_pool_type"></a> [default\_node\_pool\_type](#input\_default\_node\_pool\_type) | The type of Node Pool which should be created. Possible values are VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets. Changing this forces a new resource to be created. | `string` | `"VirtualMachineScaleSets"` | no |
| <a name="input_default_node_pool_vm_size"></a> [default\_node\_pool\_vm\_size](#input\_default\_node\_pool\_vm\_size) | VM Size des VMs créées dans ce node pool système | `string` | `"Standard_DS2_v2"` | no |
| <a name="input_default_node_pool_zones"></a> [default\_node\_pool\_zones](#input\_default\_node\_pool\_zones) | Specifies a list of Availability Zones in which this Kubernetes Cluster should be located. temporary\_name\_for\_rotation must be specified when changing this property. | `list(string)` | `null` | no |
| <a name="input_enable_logs_analytics_workspace"></a> [enable\_logs\_analytics\_workspace](#input\_enable\_logs\_analytics\_workspace) | Enables or not the Kubernetes cluster logs gathering into a Log analytics workspace | `bool` | `false` | no |
| <a name="input_identity_or_service_principal"></a> [identity\_or\_service\_principal](#input\_identity\_or\_service\_principal) | Will this cluster use an Identoty entity to be able to access other azure resources or a service principal ?"<br/><br/>  Can be ServicePrincipal or Identity | `string` | `"Identity"` | no |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | Type identité à activer sur la ressource ('UserAssigned' et 'SystemAssigned' sont les eules valeurs autorisées) | `string` | `"SystemAssigned"` | no |
| <a name="input_location"></a> [location](#input\_location) | Région hébergeant le cluster AKS | `string` | `"francecentral"` | no |
| <a name="input_network_profile_kube_dns_service_ip"></a> [network\_profile\_kube\_dns\_service\_ip](#input\_network\_profile\_kube\_dns\_service\_ip) | IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns) | `string` | `null` | no |
| <a name="input_network_profile_network_plugin"></a> [network\_profile\_network\_plugin](#input\_network\_profile\_network\_plugin) | Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created | `string` | `"azure"` | no |
| <a name="input_network_profile_network_policy"></a> [network\_profile\_network\_policy](#input\_network\_profile\_network\_policy) | Sets up network policy to be used with Azure CNI. <br/>  Network policy allows us to control the traffic flow between pods. Currently supported values are calico, azure and cilium.<br/><br/>  NOTE : When network\_policy is set to azure, the network\_plugin field can only be set to azure. | `string` | `"azure"` | no |
| <a name="input_network_profile_outbound_type"></a> [network\_profile\_outbound\_type](#input\_network\_profile\_outbound\_type) | The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer, userDefinedRouting, managedNATGateway, userAssignedNATGateway and none | `string` | `"loadBalancer"` | no |
| <a name="input_node_resource_group"></a> [node\_resource\_group](#input\_node\_resource\_group) | The name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_private_cluster"></a> [private\_cluster](#input\_private\_cluster) | Si passé à 'True', l'api de management du cluster deviendra privé et sera seulement accessible via une connection privée | `bool` | `false` | no |
| <a name="input_private_cluster_dns_rg"></a> [private\_cluster\_dns\_rg](#input\_private\_cluster\_dns\_rg) | Resource group de la zone DNS privée à spécifier si le cluster AKS est privé | `string` | `null` | no |
| <a name="input_private_cluster_dns_zone_name"></a> [private\_cluster\_dns\_zone\_name](#input\_private\_cluster\_dns\_zone\_name) | Nom de la zone DNS privée utilisée si le cluster AKS est privé | `string` | `null` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Est ce que le cluster sera privé ? Si oui une zone DNS privée devra être spécifiée | `bool` | `false` | no |
| <a name="input_service_principal_client_id"></a> [service\_principal\_client\_id](#input\_service\_principal\_client\_id) | Client ID du SPN utilisé si la variable 'identity\_or\_service\_principal' est défini sur 'ServicePrincipal' | `string` | `null` | no |
| <a name="input_service_principal_client_secret"></a> [service\_principal\_client\_secret](#input\_service\_principal\_client\_secret) | Secret du SPN utilisé si la variable 'identity\_or\_service\_principal' est défini sur 'ServicePrincipal' | `string` | `null` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard (which includes the Uptime SLA) and Premium. Defaults to Free. | `string` | `"Free"` | no |
| <a name="input_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#input\_user\_assigned\_identity\_id) | ID de l'UAI si la variable 'identity\_type' est égal à 'UserAssigned' | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->