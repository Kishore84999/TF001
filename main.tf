provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "jprg"
  location = "East US"  # Change this to your preferred region
}

resource "azurerm_app_service_plan" "example" {
  name                = "jpplan007"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"  # Change the size according to your requirements
  }
}

resource "azurerm_app_service" "example" {
  name                = "CBN-2024"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_app_service_plan.example.id
  site_config {
    linux_fx_version = "JAVA|17"  # Set JAVA version
  }
}
