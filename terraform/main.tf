provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "fintech-rg"
  location = "East US"
}

# Azure App Services (6 Web Apps)
resource "azurerm_service_plan" "app_plan" {
  name                = "fintech-app-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "P1v2"
}

/*resource "azurerm_app_service" "web_apps" {
  count               = 6
  name                = "fintech-webapp-${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
}*/

resource "azurerm_app_service" "web_apps" {
  name                = "fintech-webapp-accounts"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
}

resource "azurerm_app_service" "web_apps" {
  name                = "fintech-webapp-api"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
}

resource "azurerm_app_service" "web_apps" {
  name                = "fintech-webapp-balance"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
}

resource "azurerm_app_service" "web_apps" {
  name                = "fintech-webapp-investments"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
}

resource "azurerm_app_service" "web_apps" {
  name                = "fintech-webapp-payments"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
}

resource "azurerm_app_service" "web_apps" {
  name                = "fintech-webapp-statements"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
}

resource "azurerm_app_service" "web_apps" {
  name                = "fintech-webapp-transactions"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
}

# Azure Redis Cache
resource "azurerm_redis_cache" "redis" {
  name                = "fintech-redis"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
}

# Azure Logic Apps
resource "azurerm_logic_app_workflow" "logic_app" {
  name                = "fintech-logic-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Azure Functions
resource "azurerm_function_app" "function" {
  name                = "fintech-function"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.app_plan.id
  storage_account_access_key = "fintech-access-key"
  storage_account_name = "fintech-storage-account"
}

# Application Insights
resource "azurerm_application_insights" "app_insights" {
  name                = "fintech-app-insights"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}

# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "fintech-log-analytics"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
}

# Azure Monitor
resource "azurerm_monitor_diagnostic_setting" "monitor" {
  name                       = "fintech-monitoring"
  target_resource_id         = azurerm_application_insights.app_insights.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id
}

# Azure SQL Server & Database
resource "azurerm_sql_server" "sql_server" {
  name                         = "fintech-sql-server"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "SecurePassword123!"
}

resource "azurerm_sql_database" "sql_db" {
  name                = "fintech-sqldb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sql_server.name
  sku_name            = "S1"
}

# Azure Cosmos DB
resource "azurerm_cosmosdb_account" "cosmos" {
  name                = "fintech-cosmos"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type          = "Standard"
  kind               = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = "Session"
  }
  geo_location {
    location            = "East US"
    failover_priority  = 0
  }
}

# Resource Groups for Errors, Frauds, Integrations
resource "azurerm_resource_group" "errors" {
  name     = "fintech-errors-rg"
  location = "East US"
}

resource "azurerm_resource_group" "frauds" {
  name     = "fintech-frauds-rg"
  location = "East US"
}

resource "azurerm_resource_group" "integrations" {
  name     = "fintech-integrations-rg"
  location = "East US"
}

output "web_apps" {
  value = azurerm_app_service.web_apps[*].default_site_hostname
}
