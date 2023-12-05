terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}

# Breaking out S3 only configuration
# Create a S3 bucket for the state file
resource "aws_s3_bucket" "terraform_state" {
  bucket = "opentofu-cooked"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
  prevent_destroy = false # Prevents destroying via terraform
  }
}