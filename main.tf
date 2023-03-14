resource "azurerm_virtual_network" "this" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  dns_servers         = var.vnet_dns_servers
  bgp_community       = var.bgp_community
  dynamic "ddos_protection_plan" {
    for_each = var.enable_ddos_protection_plan ? ["enabled"] : []
    content {
      enable = var.enable_ddos_protection_plan
      id     = var.ddos_protection_plan_id
    }
  }
  tags = merge(var.default_tags, var.extra_tags)
}

#resource "azurerm_virtual_network_peering" "this" {
#  for_each                     = var.peered_vnets != null ? var.peered_vnets : []
#  name                         = format("peering-to-%s", each.value.remote_vnet_name)
#  resource_group_name          = azurerm_virtual_network.this.resource_group_name
#  virtual_network_name         = azurerm_virtual_network.this.name
#  remote_virtual_network_id    = each.value.remote_vnet_id
#  allow_virtual_network_access = try(each.value.allow_virtual_network_access, true)
#  allow_forwarded_traffic      = try(each.value.allow_forwarded_traffic, true)
#  allow_gateway_transit        = try(each.value.allow_gateway_transit, true)
#  use_remote_gateways          = try(each.value.use_remote_gateways, true)
#  #triggers                     = try(each.value.triggers, true)
#}