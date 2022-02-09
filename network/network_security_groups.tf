resource "azurerm_network_security_group" "example" {
    for_each = local.config.network_security_groups
    name                = each.key
    location            = "uksouth"
    resource_group_name = "${data.azurerm_resource_group.example.name}"

    dynamic "security_rule" {
        for_each = each.value.security_rule
        content {
            name = security_rule.key
            priority = security_rule.value.priority
            direction = security_rule.value.direction
            access = security_rule.value.access
            protocol = security_rule.value.protocol
            source_port_range = security_rule.value.source_port_range
            destination_port_range = security_rule.value.destination_port_range
            source_address_prefix = security_rule.value.source_address_prefix
            destination_address_prefix = security_rule.value.destination_address_prefix
        }
    }
}