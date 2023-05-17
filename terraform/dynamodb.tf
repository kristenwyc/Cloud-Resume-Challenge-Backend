resource "aws_dynamodb_table" "dynamodb-table-visitor-counter" {
  attribute {
    name = "Record"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
  name         = "Cloud-Resume-Visitor-Counter"
  hash_key     = "Record"
}
