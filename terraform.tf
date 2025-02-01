terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.11.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # profile = "default" # Uncomment if you have a specific AWS CLI profile
}
