data "aws_ami" "ami" {
  most_recent = true
  owners = ["679593333241"]
  filter {
    name   = "name"
    values = [" CentOS 9 x86_64 LATEST"]  # Amazon Linux 2 AMI
  }
}

data "aws_caller_identity" "identity" {}
