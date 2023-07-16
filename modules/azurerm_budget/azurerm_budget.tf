# Create resource group if it doesn't exist
resource "azurerm_resource_group" "this" {
  name     = var.azurerm_resource_group_name
  location = var.azurerm_location
}

# Create action group if it doesn't exist
resource "azurerm_monitor_action_group" "this" {
  depends_on = [resource.azurerm_resource_group.this]

  name                = var.azurerm_action_group
  resource_group_name = var.azurerm_resource_group_name
  # strip "-" from the name and max length of 12 characters
  short_name = substr(replace(var.azurerm_action_group, "-", ""), 0, 12)
}

# Create budget 
resource "azurerm_consumption_budget_resource_group" "this" {
  depends_on = [resource.azurerm_monitor_action_group.this, resource.azurerm_resource_group.this]

  name              = resource.azurerm_resource_group.this.name
  resource_group_id = resource.azurerm_resource_group.this.id
  amount            = var.azurerm_budget_amount
  time_period {
    # Get the current month and year
    start_date = formatdate("YYYY-MM-01", timestamp())
    end_date   = formatdate("YYYY-MM-01", timestamp() + 2629746)
  }
  time_grain = "Monthly"

  notification {
    enabled   = true
    threshold = 90
    operator  = "Forecasted"

    contact_emails = var.azurerm_contact_emails

    contact_groups = [
      resource.azurerm_monitor_action_group.this.id
    ]
  }

  notification {
    enabled   = true
    threshold = 100
    operator  = "GreaterThan"

    contact_emails = var.azurerm_contact_emails

    contact_groups = [
      resource.azurerm_monitor_action_group.this.id
    ]
  }
}
