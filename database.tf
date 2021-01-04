data "azurerm_client_config" "current" {}


resource "azurerm_postgresql_server" "postgresql_server" {
  name                = "${terraform.workspace}-${var.postgresql_server}"
  location            = azurerm_resource_group.beistpdatabase.location
  resource_group_name = azurerm_resource_group.beistpdatabase.name

  administrator_login          = ""
  administrator_login_password = ""

  sku_name   = "GP_Gen5_4"
  version    = "9.6"
  storage_mb = 640000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = true
  auto_grow_enabled            = true

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = true
  ssl_minimal_tls_version_enforced = "TLS1_2"
}



resource "azurerm_postgresql_database" "postgresql_database" {
  name                = "${terraform.workspace}-${var.postgresql_database}"
  resource_group_name = azurerm_resource_group.beistpdatabase.name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}