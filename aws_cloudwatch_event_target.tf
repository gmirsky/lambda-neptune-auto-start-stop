resource "aws_cloudwatch_event_target" "on_duty_start_instances" {
  rule      = aws_cloudwatch_event_rule.on_duty.name
  target_id = "start_stop_neptune"
  arn       = aws_lambda_function.start_stop_neptune.arn
  input     = <<DOC
{
  "event": "On"
}
DOC
}

resource "aws_cloudwatch_event_target" "off_duty_start_instances" {
  rule      = aws_cloudwatch_event_rule.off_duty.name
  target_id = "start_stop_neptune"
  arn       = aws_lambda_function.start_stop_neptune.arn
  input     = <<DOC
{
  "event": "Off"
}
DOC
}
