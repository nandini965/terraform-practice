data "aws_ami" "ami" {
  most_recent = true
  owners = ["694121914657"]
  tags = {
    Name   = "ami"

  }
}

