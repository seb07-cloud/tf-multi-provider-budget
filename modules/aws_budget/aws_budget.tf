resource "aws_budgets_budget" "budget" {
  name              = "budget"
  budget_type       = "COST"
  limit_amount      = var.aws_budget_amount
  limit_unit        = "EUR"
  time_period_end   = var.aws_budget_end
  time_period_start = var.aws_budget_start
  time_unit         = "MONTHLY"

  notification {
    // comparison_operator        = "FORECASTED"
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.aws_budget_threshold
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.aws_budget_contact_emails
  }
}
