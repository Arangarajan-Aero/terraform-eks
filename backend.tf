terraform {
  backend "s3" {
    bucket         = "tf-jenkins-s3"
    key            = "terraform/eks-cluster.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}