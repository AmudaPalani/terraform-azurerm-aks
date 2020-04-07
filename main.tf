provider "azurerm" {
  version = "~>2.0"
  features {}
  
  # Get the following credentials by running the command:
  # az ad sp create-for-rbac --sdk-auth
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

}

resource "azurerm_resource_group" "rg" {
  name     = "${prefix}-terraform-vnet-rg"
  location = var.location
}

resource "azurerm_virtual_network" "network" {
  name                = "${prefix}-wus-aks-vnet"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                      = "${prefix}-aks-subnet"
  resource_group_name       = "${azurerm_resource_group.rg.name}"
  address_prefix            = "10.1.0.0/24"
  virtual_network_name      = "${azurerm_virtual_network.network.name}"
}

resource "azurerm_kubernetes_cluster" "dce_cluster" {
  name       = "${prefix}-aks"
  location   = "${azurerm_resource_group.rg.location}"
  dns_prefix = "aks"

  resource_group_name = "${azurerm_resource_group.rg.name}"
  kubernetes_version  = "1.15.10"

  default_node_pool {
    name           = "aks"
    node_count     = "1"
    vm_size        = "Standard_D2"
    type           =  "AvailabilitySet" 
    vnet_subnet_id = "${azurerm_subnet.subnet.id}"
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    network_plugin = "azure"
  }

  tags = {
    Environment = "Dev"
    Billing = "DCE"
  }

}
