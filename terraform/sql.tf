resource "azurerm_mssql_server" "sql" {
  name                         = "fintech-sqlserver"
  resource_group_name          = azurerm_resource_group.main.name
  location                     = azurerm_resource_group.main.location
  version                      = "12.0"
  administrator_login          = "adminuser"
  administrator_login_password = "SecureP@ssw0rd123"
}

resource "azurerm_mssql_database" "fintechdb" {
  name                = "fintech-db"
  server_id          = azurerm_mssql_server.sql.id
  collation          = "SQL_Latin1_General_CP1_CI_AS"
}
