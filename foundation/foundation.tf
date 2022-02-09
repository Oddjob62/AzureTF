resource "azurerm_resource_group" "example" {
  name     = local.config.testrg.name
  location = "uksouth"

  tags = {
    timestamp = timestamp()
  }
}
