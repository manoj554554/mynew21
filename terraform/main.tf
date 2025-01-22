terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.46.0"
    }
  }
}

provider "azurerm" {
    features {}
  # Configuration options

}

terraform {
  backend "azurerm" {
    resource_group_name  = #{ResourceGroupName}#
    storage_account_name = #{terraformstorageaccount}#                                 
    container_name       = "tfstate"                                  
    key                  = "prod.terraform.tfstate"                   
   
  }
}

variable "rgname" {}
variable "location" {}
variable "aspname" {}
variable "webappname" {}


module "web_mysql" {
    source = "./Modules"
    rgname = var.rgname
    location = var.location  
    aspname = var.aspname
    webappname = var.webappname
}