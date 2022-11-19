output "db_server_id" {
  value = azurerm_mssql_server.db.id
}

output "db_server_name" {
  value = azurerm_mssql_server.db.name
}

output "db_database_name" {
  value = azurerm_mssql_database.db.name
}