resource "azurerm_network_security_group" "example" {
    for_each = local.config.network_security_groups
    name                = each.key
    location            = "uksouth"
    resource_group_name = "${data.azurerm_resource_group.example.name}"

    dynamic "security_rule" {
        for_each = each.value.security_rules
        content {
            name = security_rules.key
            priority = security_rules.value.priority
            direction = security_rules.value.direction
            access = security_rules.value.access
            protocol = security_rules.value.protocol
            source_port_range = security_rules.value.source_port_range
            destination_port_range = security_rules.value.destination_port_range
            source_address_prefix = security_rules.value.source_address_prefix
            destination_address_prefix = security_rules.value.destination_address_prefix
        }
    }
}