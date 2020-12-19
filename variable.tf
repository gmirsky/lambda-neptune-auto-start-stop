variable "cost_center" {
  type        = string
  description = "value to be placed in cost-center tag"
  default     = "Infrastructure-General"
}

variable "region" {
  type        = string
  description = "region to deploy into"
  default     = "us-east-1"
}

variable "on_duty_schedule_expression" {
  type        = string
  description = "cron value for the on duty schedule"
  default     = "cron(0 5.5 ? * MON-FRI *)"
}

variable "off_duty_schedule_expression" {
  type        = string
  description = "cron value for the off duty schedule"
  default     = "cron(0 16.5 ? * MON-FRI *)"
}

# The developers are located in India Standard Time (IST)
# working hours are Monday to Friday, 5:30AM UTC/GMT is 8AM IST
#
# Coordinated Universal Time is 5 hours ahead of Eastern Time
#
