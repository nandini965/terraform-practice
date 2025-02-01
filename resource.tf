resource "aws_security_group" "webSg" {
  name   = "web"
  vpc_id = aws_vpc.myvpc.id

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

#resource "aws_instance" "web" {
#  ami                    = data.aws_ami.ami.id
#  count                  = 2
#  instance_type          = "t2.micro"
#  subnet_id              = aws_subnet.sub2.id
#  vpc_security_group_ids = [aws_security_group.webSg.id]
#}
#create alb

resource "aws_launch_template" "web" {
  name_prefix   = "web"
  image_id      = data.aws_ami.ami.id
instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webSg.id]
}

resource "aws_autoscaling_group" "myag" {
  desired_capacity = 2
  max_size         = 5
  min_size         = 2
  vpc_zone_identifier = [aws_subnet.sub1.id, aws_subnet.sub2.id]  # Add subnets

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}
resource "aws_lb" "myalb" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.webSg.id]
  subnets         = [aws_subnet.sub1.id, aws_subnet.sub2.id]

  tags = {
    Name = "web"
  }
}
resource "aws_lb_target_group" "mytg" {
  name        = "mytg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.myvpc.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.myag.name
  alb_target_group_arn   = aws_lb_target_group.mytg.arn
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.myalb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mytg.arn

  }
}