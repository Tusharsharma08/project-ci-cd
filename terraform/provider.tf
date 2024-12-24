provider "azurerm" {
  features {}
}

# Set the Azure Provider source and version being used
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.94.0"
    }
  }
}
