# Terraform Multi-Cloud Budget Management Module

This Terraform module allows you to manage your cloud budgets on both AWS and Azure platforms. It helps enforce budget thresholds, and manages alerts and notifications associated with the budget.

The module uses the latest versions of the `hashicorp/aws` and `hashicorp/azurerm` providers, allowing you to take advantage of the latest features and improvements of both platforms.

## Prerequisites

- Terraform v1.0.0 or later.
- An AWS account.
- An Azure account.
- AWS CLI and Azure CLI configured with appropriate access keys.

## Features

- Set up and manage budgets in AWS and Azure.
- Apply tags to budgets.
- Set up contact emails for budget alerts.
- Control the deployment of each module based on the specified platform.

## Usage

Below is a simple example of how you might use this module in your own Terraform code:

```hcl
module "azurerm_budget" {
  source = "./modules/azurerm_budget"

  azurerm_resource_group_name               = "example_resource_group"
  azurerm_location                          = "westus"
  azurerm_action_group                      = "example_action_group"
  azurerm_consumption_budget_resource_group = "example_resource_group"
  azurerm_budget_amount                     = 100
  azurerm_tags                              = { owner = "DevOps Team" }
  azurerm_contact_emails                    = ["devops@example.com"]
  azurerm_budget_threshold                  = 80
}

module "aws_budget" {
  source = "./modules/aws_budget"

  aws_budget_amount         = 100
  aws_budget_threshold      = 80
  aws_budget_contact_emails = ["devops@example.com"]
}
```

Please ensure that the variables you pass are appropriate and valid for your cloud setup.

## Variables

The table below outlines the variables that this module uses:

| Variable                                    | Type         | Description                                                   | Default |
| ------------------------------------------- | ------------ | ------------------------------------------------------------- | ------- |
| `platforms`                                 | list(string) | The platform(s) to deploy to. Valid values are: aws, azure    | `[]`    |
| `azurerm_resource_group_name`               | string       | The name of the resource group to create.                     | N/A     |
| `azurerm_location`                          | string       | The location/region where the resource group will be created. | N/A     |
| `azurerm_action_group`                      | string       | The name of the action group to create.                       | N/A     |
| `azurerm_consumption_budget_resource_group` | string       | The name of the budget to create.                             | N/A     |
| `azurerm_budget_amount`                     | number       | The amount of the budget.                                     | N/A     |
| `azurerm_tags`                              | map(string)  | A mapping of tags to assign to the resource.                  | N/A     |
| `azurerm_contact_emails`                    | list(string) | A email address to notify when the budget is exceeded.        | N/A     |
| `azurerm_budget_threshold`                  | number       | The threshold of the budget.                                  | N/A     |
| `aws_budget_amount`                         | number       | The amount of the budget.                                     | N/A     |
| `aws_budget_contact_emails`                 | list(string) | A email address to notify when the budget is exceeded.        | N/A     |
| `aws_budget_threshold`                      | number       | The threshold of the budget.                                  | N/A     |

The platforms variable has validation that checks if all elements in the list are either "aws" or "azure". If any other value is present, it will throw an error.

These variables help control different aspects of your cloud budget management setup, including the names of resources, budget amounts, and thresholds. Each one plays a critical role in the module's functionality.

## Considerations

The module will deploy resources based on the platforms variable, which should be a list containing either aws, azure, or both.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

Please feel free to contribute and submit PRs. We appreciate your support!
Authors

    seb07

## Acknowledgments

Acknowledge the people or resources that have helped you.
