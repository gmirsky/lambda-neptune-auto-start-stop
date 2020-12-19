resource "aws_lambda_permission" "allow_cloudwatch_to_call_On_duty" {
  statement_id  = "AllowExecutionFromCloudWatchOn"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.start_stop_neptune.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.on_duty.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_Off_duty" {
  statement_id  = "AllowExecutionFromCloudWatchOff"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.start_stop_neptune.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.off_duty.arn
}