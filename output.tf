output "beistpdatabase" {
  value = azurerm_resource_group.beistpdatabase.name
}

output "App_service_plan" {
  value = azurerm_app_service_plan.beistpdatabase.name
}

output "webapp_adminportal" {
  value = azurerm_app_service.adminportal.name
}

output "webapp_publicsearhportal" {
  value = azurerm_app_service.publicsearhportal.name
}


output "webapp_adminportalworkspace" {
  value = azurerm_app_service.adminportalworkspace.name
}


output "webapp_publishingsubsidiesservices" {
  value = azurerm_app_service.publishingsubsidiesservices.name
}


output "webapp_publicsearchservice" {
  value = azurerm_app_service.publicsearchservice.name
}

