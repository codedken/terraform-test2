// Create a load balancer
resource "aws_lb" "lb" {
  name                       = "${var.project_name}-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.lb_sg.id]
  subnets                    = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
  enable_deletion_protection = false
  depends_on                 = [aws_internet_gateway.igw]
}

// Create target group
resource "aws_lb_target_group" "lb_tg" {
  name        = "${var.project_name}-tg"
  target_type = "instance"
  protocol    = "HTTP"
  port        = 80
  vpc_id      = aws_vpc.vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    healthy_threshold   = 3
    timeout             = 3
    unhealthy_threshold = 3
  }
}

// Create a map of the IDs of the 3 instances to enable easy attachment to the target group
locals {
  servers = {
    s1 = "${aws_instance.web1.id}"
    s2 = "${aws_instance.web2.id}"
    s3 = "${aws_instance.web3.id}"
  }
}

// Attach target group to instances

resource "aws_lb_target_group_attachment" "tg_attach" {
  for_each         = local.servers
  target_id        = each.value
  target_group_arn = aws_lb_target_group.lb_tg.arn
  port             = 80
}


// Create a load balancer listener

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.lb_tg.arn
    type             = "forward"
  }
}
