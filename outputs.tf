output "client_certificate" {
  value = azurerm_kubernetes_cluster.dce_cluster.kube_config.0.client_certificate
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.dce_cluster.name
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.dce_cluster.kube_config_raw
}
