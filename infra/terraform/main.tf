resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}-${random_string.suffix.result}"
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = substr("${var.acr_name_prefix}${random_string.suffix.result}", 0, 50) # ACR name length limits
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = false
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = substr("${var.aks_name_prefix}-${random_string.suffix.result}", 0, 63)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks${random_string.suffix.result}"

  default_node_pool {
    name       = "agentpool"
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }

  role_based_access_control_enabled = true
  }

