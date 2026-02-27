terraform {
  backend "s3" {
    bucket         = "nithin-vaali"
    key            = "eks-terraform/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}