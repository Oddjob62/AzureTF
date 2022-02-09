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
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
#    security_group = "${azurerm_network_security_group.example.id}"
  }

  tags = {
    environment = "Production"
  }
}

