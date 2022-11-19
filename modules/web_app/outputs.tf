output "asp_id" {
  value = azurerm_service_plan.asp.id
}

output "app_id" {
  value = azurerm_windows_web_app.app.id
}

output "app_name" {
  value = azurerm_windows_web_app.app.name
}

output "app_staging_url" {
  value = azurerm_windows_web_app_slot.app-staging.default_hostname
}