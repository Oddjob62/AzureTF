terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

locals {
  config_content = file("../Configs/config.yaml")
  config         = yamldecode(local.config_content)
  default_tags   = {}
}

resource "azurerm_resource_group" "example" {
  name     = local.config.testrg.name
  location = "uksouth"

  tags = {
    timestamp = timestamp()
  }
}


