
resource "aws_cloudwatch_event_rule" "on_duty" {
  name                = "neptune_on_duty"
  description         = "Fires at the beginning of the working day"
  schedule_expression = var.on_duty_schedule_expression
  tags = {
    cost-center       = var.cost_center
    terraform_managed = true
  }
}

resource "aws_cloudwatch_event_rule" "off_duty" {
  name                = "neptune_off_duty"
  description         = "Fires at the end of the working day"
  schedule_expression = var.off_duty_schedule_expression
  tags = {
    cost-center       = var.cost_center
    terraform_managed = true
  }
}


