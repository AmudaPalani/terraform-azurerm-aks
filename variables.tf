variable "resource_group_name" {
  description = "Resource group name that the AKS will be created in"
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
}

variable "client_id" {
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
}

variable "client_secret" {
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
}

variable "tenant_id" {
  description = "Azure tenant used for the AKS deployment"
}
variable "subscription_id" {
  description = "Azure subscription used for the AKS deployment"
}

variable "agent_count" {
  default = 3
}

# variable "ssh_public_key" {
#     default = "~/.ssh/id_rsa.pub"
# }

variable "dns_prefix" {
  default = "aks-k8s"
}

variable cluster_name {
  default = "aks-k8s"
}

variable location {
  default = "centralus"
}

# variable log_analytics_workspace_name {
#     default = "testLogAnalyticsWorkspaceName"
# }

# # refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
# variable log_analytics_workspace_location {
#     default = "eastus"
# }

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
# variable log_analytics_workspace_sku {
#     default = "PerGB2018"
# }
