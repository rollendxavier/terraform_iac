# App Service Plan + Slots
resource "azurerm_service_plan" "asp" {
  name                = "tf-asp-demo"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "P1v2"

  tags = {
    environment = var.environment_tag
  }
}

resource "azurerm_windows_web_app" "app" {
  name                = "tf-app-demo"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.asp.id

  https_only = true

  site_config {
    always_on                = false
    http2_enabled            = true
  }

  tags = {
    environment = var.environment_tag
  }
}

resource "azurerm_app_service_virtual_network_swift_connection" "app" {
  app_service_id = azurerm_windows_web_app.app.id
  subnet_id      = var.subnet_id
}

resource "azurerm_windows_web_app_slot" "app-staging" {
  name                = "staging"
  app_service_id      = azurerm_windows_web_app.app.id

  https_only = true

  site_config {
    always_on                = false
    http2_enabled            = true
    websockets_enabled       = false
  }

  tags = {
    environment = var.environment_tag
  }
}

resource "azurerm_app_service_slot_virtual_network_swift_connection" "app-staging" {
  slot_name      = azurerm_windows_web_app_slot.app-staging.name
  app_service_id = azurerm_windows_web_app.app.id
  subnet_id      = var.subnet_id
}
