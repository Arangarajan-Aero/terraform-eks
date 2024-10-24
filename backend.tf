resource "aws_dynamodb_table" "dynamodb_terraform_state_lock" {
  name     = "terraform-state-lock-dynamo"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    bucket         = "backend-statelock-s3-buckert" 
    key            = "terraform/eks-cluster.tfstate"
    region         = var.aws_region
    dynamodb_table = aws_dynamodb_table.dynamodb_terraform_state_lock.name
    encrypt        = true
  }
}

