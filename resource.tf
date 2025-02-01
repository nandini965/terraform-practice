resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = var.vpc

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Websg"
  }
}

resource "aws_instance" "myinstance" {
  ami               = "ami-04b4f1a9cf54c11d0"
  instance_type     = "t2.micro"
  security_groups   = aws_security_group.webSg.id