output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "cosmos_db_endpoint" {
  value = azurerm_cosmosdb_account.cosmos.endpoint
}

output "redis_hostname" {
  value = azurerm_redis_cache.redis.hostname
}

output "keyvault_uri" {
  value = azurerm_key_vault.keyvault.vault_uri
}
