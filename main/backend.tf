terraform {
  backend "azurerm" {
    container_name = "state"
    key            = "network.terraform.tfstate"
  }
}