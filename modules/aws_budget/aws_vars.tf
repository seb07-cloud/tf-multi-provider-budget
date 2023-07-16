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
