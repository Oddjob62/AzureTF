terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 1.1.0"
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
}

locals {
  config_content = file("../configs/config.yaml")
  config         = yamldecode(local.config_content)
  default_tags   = {}
}

