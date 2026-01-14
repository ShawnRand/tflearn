terraform {
  required_version = ">= 1.3.37"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
  cloud { 
  
    organization = "shawn-rand-org" 
    workspaces { 
      name = "TF-learn" 
    } 
  } 

}

provider "azurerm" {
  features {
  }
subscription_id = "14c8855a-3421-4f88-afd0-57a81ae845c4"
}

resource "azurerm_resource_group" "rg" {
  name     = "tflearn"
  location = "West US 2"
    tags = {
        Environment = "Learning"
        Project     = "Terraform"
    }   
}

resource "azurerm_storage_account" "storage" {
  name                     = "shrandstlearntf"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
tags = {
    Environment = "Learning"
    Project     = "Terraform"
  }
} 