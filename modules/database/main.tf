# SQL Database
resource "azurerm_mssql_server" "db" {
  name                         = "tf-dbsrv"
  resource_group_name          = var.resource_group_name
  location                     = var.resource_location
  version                      = "12.0"
  administrator_login          = "missadministrator"
  administrator_login_password = "Sq123@p-p455w0rd-enV1r0nm3nT"
  public_network_access_enabled = true
  
  tags = {
    environment = var.environment_tag
  }
}

resource "azurerm_mssql_database" "db" {
  name           = "tf-db"
  server_id      = azurerm_mssql_server.db.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  read_scale     = false
  sku_name       = "Basic"
  
  tags = {
    environment = var.environment_tag
  }
}

resource "azurerm_mssql_server_transparent_data_encryption" "db" {
  server_id = azurerm_mssql_server.db.id
}

resource "azurerm_mssql_virtual_network_rule" "db" {
  name      = "tf-db-vnet"
  server_id = azurerm_mssql_server.db.id
  subnet_id = var.subnet_id
}