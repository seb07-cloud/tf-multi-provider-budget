terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.8.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.65.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

provider "azurerm" {
  features {}
}

module "azurerm_budget" {
  source = "./modules/azurerm_budget"
  count  = contains(var.platforms, "azure") ? 1 : 0

  azurerm_resource_group_name               = var.azurerm_resource_group_name
  azurerm_location                          = var.azurerm_location
  azurerm_action_group                      = var.azurerm_action_group
  azurerm_consumption_budget_resource_group = var.azurerm_consumption_budget_resource_group
  azurerm_budget_amount                     = var.azurerm_budget_amount
  azurerm_tags                              = var.azurerm_tags
  azurerm_contact_emails                    = var.azurerm_contact_emails
  azurerm_budget_threshold                  = var.azurerm_budget_threshold
}

module "aws_budget" {
  source = "./modules/aws_budget"
  count  = contains(var.platforms, "aws") ? 1 : 0

  aws_budget_amount         = var.aws_budget_amount
  aws_budget_threshold      = var.aws_budget_threshold
  aws_budget_contact_emails = var.aws_budget_contact_emails

}
