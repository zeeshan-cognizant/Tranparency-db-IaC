


resource "azurerm_frontdoor" "adminportal_fd" {
  name                      = "${local.adminportal_fd_name}"
  location                  = azurerm_resource_group.beistpdatabase.location
  resource_group_name       = azurerm_resource_group.beistpdatabase.name
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = "${local.adminportal_fd_routingrule_name}"
    accepted_protocols = ["Http","Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["${local.adminportal_fd_name}"]
    forwarding_configuration {
      forwarding_protocol = "HttpsOnly"
      backend_pool_name   = "adminportalbackendpool"
    }
  }

  backend_pool_load_balancing {
    name = "adminportalLoadBalancingSettings1"
  }

  backend_pool_health_probe {
    name = "adminportalHealthprobeSettings1"
    protocol = "Https"
  }

  backend_pool {
    name = "adminportalbackendpool"
    backend {
      host_header = "${azurerm_app_service.adminportal.name}.azurewebsites.net"
      address     = "${azurerm_app_service.adminportal.name}.azurewebsites.net"
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = "adminportalLoadBalancingSettings1"
    health_probe_name   = "adminportalHealthprobeSettings1"
  }

  frontend_endpoint {
    name                              = "${local.adminportal_fd_name}"
    host_name                         = "${local.adminportal_fd_name}.azurefd.net"
    custom_https_provisioning_enabled = false
     web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.adminportal_fd_waf_policy.id
  }
}



resource "azurerm_frontdoor_firewall_policy" "adminportal_fd_waf_policy" {
  name                              = var.adminportal_fd_waf_policy_name
  resource_group_name               = azurerm_resource_group.beistpdatabase.name
  enabled                           = true
  mode                              = "Prevention"
  custom_block_response_status_code = 403 
  /*
  custom_block_response_body takes in is a base 64 encoded string, hence this is the base 64 encoded string for 
  "blocked by frontdoor"
  */
  custom_block_response_body        = "YmxvY2tlZCBieSBmcm9udGRvb3I="

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"
  }

  managed_rule {
    type    = "Microsoft_BotManagerRuleSet"
    version = "1.0"
  }
}