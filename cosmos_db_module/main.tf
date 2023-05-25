resource "azurerm_resource_group" "local_param_ref" {
  name     = var.resoure_group_name
  location = var.resoure_group_location
  tags = var.common_tags
}

# locals {
#   # Common tags to be assigned to all resources
#   geo_location = {
#     location          = "eastus"
#     failover_priority = 0
#   }
# }

resource "azurerm_cosmosdb_account" "local_param_ref" {
  name                = var.azurerm_cosmosdb_account_name
  location            = azurerm_resource_group.local_param_ref.location
  resource_group_name = azurerm_resource_group.local_param_ref.name
  offer_type          = var.azurerm_cosmosdb_account_offertype
  kind                = var.azurerm_cosmosdb_account_kind

  enable_automatic_failover = true

dynamic "capabilities" {
    for_each = toset(var.capabilities_list)
    //for_each = lookup(each.value,"capabilities_list",[])
    content {
      name = capabilities.value
    }
    
}
  
#   capabilities {
#     name = "EnableAggregationPipeline"
#   }

#   capabilities {
#     name = "mongoEnableDocLevelTTL"
#   }

#   capabilities {
#     name = "MongoDBv3.4"
#   }

#   capabilities {
#     name = "EnableMongo"
#   }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "eastus"
    failover_priority = lookup(var.azurerm_cosmosdb_account_geo_location,"eastus")
  }

  geo_location {
    location          = "westus"
    #failover_priority = lookup(var.azurerm_cosmosdb_account_geo_location,azurerm_resource_group.local_param_ref.location,0)
    failover_priority = lookup(var.azurerm_cosmosdb_account_geo_location,"westus")
  }
  tags = var.common_tags
}