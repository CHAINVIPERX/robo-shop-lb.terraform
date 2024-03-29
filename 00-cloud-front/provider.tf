terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
  backend "s3" {
    bucket         = "ladoo-loadbal"
    key            = "cloudfront"
    region         = "us-east-1"
    dynamodb_table = "ladoo-locking-loadbal"
  }
}

provider "aws" {
  region = "us-east-1"
}
