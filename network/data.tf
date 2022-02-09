data "azurerm_resource_group" "example" {
  name     = local.config.testrg.name
}

data "azurerm_key_vault" "transitkeyvault" {
  name                = local.config.secrets_key_vault.name
  resource_group_name = local.config.secrets_key_vault.resource_group_name
}
data "azurerm_key_vault_secret" "my_home_ip" {
  name         = "my-home-ip"
  key_vault_id = data.azurerm_key_vault.transitkeyvault.id
}


#data.azurerm_key_vault_secret.my_home_ip.value