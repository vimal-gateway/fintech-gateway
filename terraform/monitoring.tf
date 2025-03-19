resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "fintech-log-analytics"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "PerGB2018"
}

resource "azurerm_application_insights" "app_insights" {
  name                = "fintech-app-insights"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = "web"
}
