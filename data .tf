data "archive_file" "init" {
  type        = "zip"
  source_file = "${path.module}/src/lambda_function.py"
  output_path = "${path.module}/src/lambda_function.zip"
}

data "aws_caller_identity" "current" {
}
