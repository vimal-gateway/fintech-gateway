resource "azurerm_redis_cache" "redis" {
  name                = "fintech-redis"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  capacity           = 2
  family            = "C"
  sku_name          = "Standard"
}
