resource "azurerm_app_service_plan" "beistpdatabase" {
  name                = "${local.sp_name}-service-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.beistpdatabase.name
  kind                = "Linux"

  # Reserved must be set to true for Linux App Service Plans
  reserved = true

  sku {
    tier = var.plan_tier
    size = var.plan_sku
  }
}

resource "azurerm_app_service" "adminportal" {
  name                = "${terraform.workspace}-${var.admin_portal}"
  location            = azurerm_resource_group.beistpdatabase.location
  resource_group_name = azurerm_resource_group.beistpdatabase.name
  app_service_plan_id = azurerm_app_service_plan.beistpdatabase.id
  https_only = true

  site_config {
linux_fx_version = "NODE|10.14"
  }

  identity {
    type = "SystemAssigned"
  }
}


resource "azurerm_app_service" "publicsearhportal" {
  name                = "${terraform.workspace}-${var.public_searhportal}"
  location            = azurerm_resource_group.beistpdatabase.location
  resource_group_name = azurerm_resource_group.beistpdatabase.name
  app_service_plan_id = azurerm_app_service_plan.beistpdatabase.id
  https_only = true

  site_config {
linux_fx_version = "NODE|10.14"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_app_service" "adminportalworkspace" {
  name                = "${terraform.workspace}-${var.adminportal_workspace}"
  location            = azurerm_resource_group.beistpdatabase.location
  resource_group_name = azurerm_resource_group.beistpdatabase.name
  app_service_plan_id = azurerm_app_service_plan.beistpdatabase.id
  https_only = true

  site_config {
linux_fx_version = "NODE|10.14"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_app_service" "publishingsubsidiesservices" {
  name                = "${terraform.workspace}-${var.publishingsubsidies_services}"
  location            = azurerm_resource_group.beistpdatabase.location
  resource_group_name = azurerm_resource_group.beistpdatabase.name
  app_service_plan_id = azurerm_app_service_plan.beistpdatabase.id
  https_only = true

  site_config {
linux_fx_version = "NODE|10.14"
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_app_service" "publicsearchservice" {
  name                = "${terraform.workspace}-${var.publicsearch_service}"
  location            = azurerm_resource_group.beistpdatabase.location
  resource_group_name = azurerm_resource_group.beistpdatabase.name
  app_service_plan_id = azurerm_app_service_plan.beistpdatabase.id
  https_only = true

  site_config {
linux_fx_version = "NODE|10.14"
  }

  identity {
    type = "SystemAssigned"
  }
}