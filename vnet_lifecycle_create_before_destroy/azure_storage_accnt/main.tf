resource "azurerm_resource_group" "myrg" {
    name="myrg-1"
    location = "East US"
}
resource "random_string" "myrandom" {
  length = 16
  upper = false 
  special = false
}

resource "azurerm_storage_account" "example" {
  name                     = "my${random_string.myrandom.id}"
  resource_group_name      = azurerm_resource_group.myrg.name
  location                 = azurerm_resource_group.myrg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}