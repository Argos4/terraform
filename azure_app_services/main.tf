terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.29.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "calapi"
  location = "eastus2"
}

resource "azurerm_service_plan" "example" {
  name                = "calapi-app-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "example" {
  name                = "calapi"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    application_stack {
    docker_image = "anisdock/calapi"
    docker_image_tag = "latest"
  }
  }
  app_settings = {
    "WEBSITES_PORT" = "8000"
  }

  
}