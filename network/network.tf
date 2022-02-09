data "azurerm_resource_group" "example" {
  name     = local.config.testrg.name
}

# resource "azurerm_network_security_group" "example" {
#   name                = "acceptanceTestSecurityGroup1"
#   location            = "${data.azurerm_resource_group.example.location}"
#   resource_group_name = "${data.azurerm_resource_group.example.name}"
# }

resource "azurerm_virtual_network" "example" {
  for_each = local.config.networks

  name                = each.key
  location            = "${data.azurerm_resource_group.example.location}"
  resource_group_name = "${data.azurerm_resource_group.example.name}"
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_servers

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name           = subnet.key
      address_prefix = subnet.value.address_prefix
      #security_group = subnet.security_group_id ? subnet.security_group_id : null
    }
  }

  # subnet {
  #   name           = "subnet2"
  #   address_prefix = "10.0.2.0/24"
  # }

  # subnet {
  #   name           = "subnet3"
  #   address_prefix = "10.0.3.0/24"
  #   security_group = "${azurerm_network_security_group.example.id}"
  # }

  tags = {
    environment = "Production"
  }
}

