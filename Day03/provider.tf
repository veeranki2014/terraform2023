terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "mashtfstat-s3"
    key = "timing"
    region = "us-east-1" 
    dynamodb_table = "mashtfstat-s3-look"   
  }
}

##Configure the AWS Provider
provider "aws" {
    region = "us-east-1"  
}