resource "azurerm_network_security_group" "example" {
    for_each = local.config.network_security_groups
    name                = each.key
    location            = uksouth
    resource_group_name = "${data.azurerm_resource_group.example.name}"
}