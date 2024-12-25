terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.4.0"
    }
  }
}

provider "azurerm" {
subscription_id = "68829f9b-7af3-4abd-a426-738b9d371c70"
features {}
}
