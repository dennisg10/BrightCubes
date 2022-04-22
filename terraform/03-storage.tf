# Create Storage Account for Terraform Productie
resource "azurerm_storage_account" "storageterraform" {
  name                     = "sa${replace(var.rg_prefix_short, "-", "")}001sf"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"

  tags = var.tags
}

# Create Container Terraform 
resource "azurerm_storage_container" "terraform_prod" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.storageterraform.name
  container_access_type = "private"
}

# Create Container Terraform for modules
resource "azurerm_storage_container" "tfstate_modules_networks" {
  name                  = "networkmodules"
  storage_account_name  = azurerm_storage_account.storageterraform.name
  container_access_type = "private"
}

