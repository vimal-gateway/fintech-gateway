resource "azurerm_key_vault" "keyvault" {
  name                = "fintech-keyvault"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku_name            = "standard"
  tenant_id           = "your-tenant-id"
}

resource "azurerm_key_vault_secret" "stripe_secret" {
  name         = "stripe-secret-key"
  value        = "sk_test_xxx"
  key_vault_id = azurerm_key_vault.keyvault.id
}
