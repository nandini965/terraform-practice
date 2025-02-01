terraform {
  backend "s3" {
    bucket = "mybucket92"
    key = "roboshop/dev/terraform.tfstate"
    region = "ap-south-1"


  }
}

