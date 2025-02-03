data "aws_ami" "ami" {
  most_recent = true
  owners      =  ["137112412989"]
}
data "aws_caller_identity" "identity" {}
