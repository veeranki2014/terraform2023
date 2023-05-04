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
    dynomodynamodb_table = "mashtfstat-s3-lock"   
  }
}

##Configure the AWS Provider
provider "aws" {
    region = "us-east-1"  
}