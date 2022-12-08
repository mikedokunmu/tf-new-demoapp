provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "tf-webapp-rg"
  location = "eastus"
}

resource "azurerm_service_plan" "asp" {
  name                = "appserviceplan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "webapp" {
  name                = "webapp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.asp.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {}
}