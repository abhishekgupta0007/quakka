output "acr_login_server" {
  description = "ACR login server (use to tag/push images)"
  value       = azurerm_container_registry.acr.login_server
}

output "aks_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "resource_group" {
  description = "Resource group created"
  value       = azurerm_resource_group.rg.name
}

output "acr_name" {
  description = "ACR name"
  value       = azurerm_container_registry.acr.name
}

output "kube_config_instructions" {
  description = "How to fetch kubeconfig for kubectl"
  value       = "Run: az aks get-credentials --resource-group ${azurerm_resource_group.rg.name} --name ${azurerm_kubernetes_cluster.aks.name} --overwrite-existing"
}
