variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Azure region to use."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "environment" {
  description = "Project environment."
  type        = string
}

variable "stack" {
  description = "Project stack name."
  type        = string
  validation {
    condition     = var.stack == "" || can(regex("^[a-z0-9]([a-z0-9-]*[a-z0-9])?$", var.stack))
    error_message = "Invalid variable: ${var.stack}. Variable name must start with a lowercase letter, end with an alphanumeric lowercase character, and contain only lowercase letters, digits, or a dash (-)."
  }
}

variable "vnet_address_space" {
  description = "VNET address space"
  type        = list(string)
}

variable "vnet_dns_servers" {
  description = "VNET DNS servers"
  type        = list(string)
  default     = []
}

variable "bgp_community" {
  description = "The BGP community attribute in format <as-number>:<community-value>."
  type        = string
  default     = null
}

variable "ddos_protection_plan_id" {
  description = "The ID of DDoS Protection Plan. Required if ddos_proction_plan is enabled"
  type        = string
  default     = null
}

variable "enable_ddos_protection_plan" {
  description = "Enable/disable DDoS Protection Plan on Virtual Network."
  type        = bool
  default     = false
}

variable "peered_vnets" {
  description = "List of vnets to peered with. The elements of the list should have the following format"
  type = list(object({
    remote_virtual_network_id    = string
    allow_virtual_network_access = optional(bool, true)
    allow_forwarded_traffic      = optional(bool, true)
    allow_gateway_transit        = optional(bool, true)
    use_remote_gateways          = optional(bool, true)
    triggers                     = optional(map(string), null)
    })
  )

  default = null
}
