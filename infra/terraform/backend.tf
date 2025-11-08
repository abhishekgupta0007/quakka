terraform {
  backend "azurerm" {
    resource_group_name  = "demo-rg-g4p93s"
    storage_account_name = "demoacrtfstateg4p93s"
    container_name       = "tfstate-container"
    key                  = "terraform.tfstate"
  }
}

