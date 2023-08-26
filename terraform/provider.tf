# PROVIDER
terraform {

  required_version = "~> 1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.55"
    }
  }

}

#S3
  backend "s3" {
    bucket         = "tf-terraform-hello-world-state-pablinhos"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }

  
module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "tf-terraform-hello-world-state-v1"
  hash_key = "LockID"
}