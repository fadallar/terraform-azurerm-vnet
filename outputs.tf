
output "id" {
  description = "The virtual NetworkConfiguration ID."
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.this.name
}

output "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  value       = azurerm_virtual_network.this.resource_group_name
}

output "location" {
  description = "The location/region where the virtual network is created. Changing this forces a new resource to be created."
  value       = azurerm_virtual_network.this.location
}

output "address_space" {
  description = "The list of address spaces used by the virtual network."
  value       = azurerm_virtual_network.this.address_space
}

output "guid" {
  description = "The GUID of the virtual network."
  value       = azurerm_virtual_network.this.guid
}

