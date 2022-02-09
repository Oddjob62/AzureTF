data "azurerm_resource_group" "example" {
  name     = local.config.testrg.name
}

data "azurerm_key_vault" "transitkeyvault" {
  name                = "transitkeyvault"
  resource_group_name = "Admin"
}
data "azurerm_key_vault_secret" "my_home_ip" {
  name         = "my-home-ip"
  key_vault_id = data.azurerm_key_vault.transitkeyvault.id
}


#data.azurerm_key_vault_secret.my_home_ip.value