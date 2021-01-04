locals {
  full_rg_name = "${terraform.workspace}-${var.resource_group_name}"
}

locals {
  sp_name = "${terraform.workspace}-${var.organization_name}"
}

locals {
  db_name = "${terraform.workspace}-${var.organization_name}"
}

locals {
  adminportal_fd_name = "${terraform.workspace}-${var.adminportal_fd}"
}

locals {
  adminportal_fd_routingrule_name = "${terraform.workspace}-${var.adminportal_fd_waf_policy_name}"
}

locals {
  access_key_vault_name = "${terraform.workspace}-${var.access_key_vault_name}"
}

variable "subcription" {
  description = ""
  default     = ""
}

variable "location" {
  description = ""
  default     = "uksouth"
}

variable "resource_group_name" {
  description = ""
  default     = "beis-tpdb-rg"
}


variable "organization_name" {
  description = ""
  default     = "beis-tpdb"
}


variable "admin_portal" {  
  description = ""
  default     = "admin-portal"
}

variable "plan_tier" {  
  description = "The tier of app service plan to create"
  default     = "Premium"
}

variable "plan_sku" { 
  description = "The sku of app service plan to create"
  default     = "P2V2"
}

variable "public_searhportal" {  
  description = ""
  default     = "public-searhportal"
}

variable "adminportal_workspace" {  
  description = ""
  default     = "adminportal-workspace"
}

variable "publishingsubsidies_services" {  
  description = ""
  default     = "publishingsubsidies-services"
}

variable "publicsearch_service" {  
  description = ""
  default     = "publicsearch-service"
}

variable "postgresql_server" {  
  description = ""
  default     = "publicsearch-service"
}

variable "postgresql_database" {  
  description = ""
  default     = "postgresql-database"
}

variable "database_adminuser" {  
  description = ""
  default     = ""
}

variable "adminportal_fd" {  
  description = ""
  default     = "adminportal-fd"
}

variable "adminportal_fd_rule" {  
  description = ""
  default     = "adminportal-fd-rule"
}

variable "adminportal_fd_waf_policy_name" {  
  description = ""
  default     = "adminportalwafpolicy"
}

variable "access_key_vault_name" {  
  description = ""
  default     = "tpdbaccesskeyvault"
}


variable "sku_name" {
  default = "standard"
}

variable "enabled_for_deployment" {
  default = true
}

variable "enabled_for_disk_encryption" {
  default = true
}

variable "enabled_for_template_deployment" {
  default = true
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "policies" {
  type = map(object({
    tenant_id               = string
    object_id               = string
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
  }))
  default = {}
}

variable "secrets" {
  type = map(object({
    value = string
  }))
  default = {}
}