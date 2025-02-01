terraform {
  backend "s3" {
    bucket = "nandini_bucket_for_practice"
    key = "nandini/terraform.tfstate"
    region = "us-east-1"


  }
}

