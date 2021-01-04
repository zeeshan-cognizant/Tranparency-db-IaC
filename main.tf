provider "azurerm" {
 version = "~>2.0"
 features {}
}



resource "azurerm_resource_group" "beistpdatabase" {
  name     = local.full_rg_name
  location = var.location 
}


