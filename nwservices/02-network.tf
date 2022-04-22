# Create vnet and subnets for Networking Services
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.rg_prefix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["${var.address_space_prefix}.0.0/24"]

  tags = var.tags
}

# Create GatewaySubnet
resource "azurerm_subnet" "gwsubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.0.160/27"]
}

# Create a AzureFirewallSubnet
resource "azurerm_subnet" "afwsubnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["${var.address_space_prefix}.0.192/26"]
}





