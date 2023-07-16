variable "platforms" {
  type        = list(string)
  description = "The platform(s) to deploy to. Valid values are: aws, azure"
  default     = []

  validation {
    condition     = alltrue([for platform in var.platforms : contains(["aws", "azure"], platform)])
    error_message = "Invalid platform. Valid values are: aws, azure"
  }
}

variable "azurerm_resource_group_name" {
  type        = string
  description = "The name of the resource group to create."
}

variable "azurerm_location" {
  type        = string
  description = "The location/region where the resource group will be created."
}

variable "azurerm_action_group" {
  type        = string
  description = "The name of the action group to create."
}

variable "azurerm_consumption_budget_resource_group" {
  type        = string
  description = "The name of the budget to create."
}

variable "azurerm_budget_amount" {
  type        = number
  description = "The amount of the budget."
}

variable "azurerm_tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "azurerm_contact_emails" {
  type        = list(string)
  description = "A email address to notify when the budget is exceeded."
}

variable "azurerm_budget_threshold" {
  type        = number
  description = "The threshold of the budget."
}

variable "aws_budget_amount" {
  type        = number
  description = "The amount of the budget."
}

variable "aws_budget_contact_emails" {
  type        = list(string)
  description = "A email address to notify when the budget is exceeded."
}

variable "aws_budget_threshold" {
  type        = number
  description = "The threshold of the budget."
}

# Path: modules/azurerm_budget/azurerm_budget.tf
