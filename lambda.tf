resource "aws_lambda_function" "lambda-visitor-counter" {
  description   = ""
  function_name = "Cloud-Resume-Visitor-Counter-Python"
  handler       = "lambda_function.lambda_handler"
  architectures = [
    "x86_64"
  ]
  s3_bucket         = var.lambda_s3_bucket
  s3_key            = var.lambda_s3_key
  s3_object_version = var.lambda_s3_object_version
  role              = var.lambda_role
  runtime           = "python3.10"
}
