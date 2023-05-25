variable "common_tags" {
  type = map(string)
}


variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "myrg"
}

variable "resoure_group_location" {
  description = "Resource Group Location"
  type = string
  default = "East US"
}
variable "azurerm_cosmosdb_account_name" {
  description = "Cosmos DB name"
  type = string 
  default = "djangotangodb"
}

variable "azurerm_cosmosdb_account_offertype" {
  description = "Offer type"
  type = string 
  default = "Standard"
}

variable "azurerm_cosmosdb_account_kind" {
  description = "Database kind"
  type = string 
  default = "MongoDB"
}

variable "azurerm_cosmosdb_account_geo_location" {
 type = map(string)
 default = {
    "eastus" = 1
    "westus" = 0
 }
}

variable "capabilities_list" {
    type = list( string)
}