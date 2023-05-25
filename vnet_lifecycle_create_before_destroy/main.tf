terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">=2.0"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_virtual_network" "vnetresource" {
    name = "vnet1"
    location = "eastus2"
    resource_group_name = "myrg"
    address_space       = ["10.0.0.0/16"]
    
    # lifecycle {
    #     create_before_destroy = true
    #     prevent_destroy = true 
    #     ignore_changes = [
    #   # Ignore changes to tags, e.g. because a management agent
    #   # updates these based on some ruleset managed elsewhere.
    #   tags,
    # ]
    # }

}