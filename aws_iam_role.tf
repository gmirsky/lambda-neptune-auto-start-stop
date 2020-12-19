resource "aws_iam_role" "lambda_exec" {
  name = "neptune-start-stop-assume-role"
  tags = {
    cost-center       = var.cost_center
    terraform_managed = true
  }
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "lambda.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
      ]
    }
EOF
}
