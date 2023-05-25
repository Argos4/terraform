terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.2"
      
    }
  }
}
provider "azurerm" {
    features {
    }   
}

resource "azurerm_resource_group" "myvm" {
  name     = "myvm-resources"
  location = "West Europe"
}