############################################################
# Configuration for the provider used by terraform
# i.e: AWS provider - resources will be created on AWS
############################################################

provider "aws" {
  region = var.aws_region
}

############################################################
# Configuration for the provider used by terraform
# i.e: AWS provider - resources will be created on AWS
############################################################

terraform {
  backend "s3" {
    bucket = "terraform-tfstate-atlantis-bruno-us-east-1"
    key    = "development/us-east-1/atlantis-terraform"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "bucket_site" {
    bucket = "bruno-atlantis-rename"
    acl    = "private"
}

resource "aws_sqs_queue" "terraform_queue" {
  name                      = "devparana-atlantis-example-queue"
  delay_seconds             = 40
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  
  tags = {
    Environment = "production"
  }
}