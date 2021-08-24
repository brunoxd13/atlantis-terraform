############################################################
# Configuration for the provider used by terraform
# i.e: AWS provider - resources will be created on AWS
############################################################

provider "aws" {
  region = var.aws_region
}

############################################################
# Configuration for the terraform state file
############################################################

terraform {
  backend "s3" {
    bucket = "terraform-tfstate-atlantis-bruno-us-east-1"
    key    = "development/us-east-1/atlantis-terraform"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "bucket_site" {
    bucket = "bruno-atlantis"
    acl    = "private"
}

resource "aws_s3_bucket" "bucket_tdc" {
    bucket = "trilha-devops-tdc-atlantis"
    acl    = "private"
}