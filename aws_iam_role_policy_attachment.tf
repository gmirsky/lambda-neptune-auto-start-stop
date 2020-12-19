resource "aws_iam_role_policy_attachment" "policy-attachment" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.policy.arn
}