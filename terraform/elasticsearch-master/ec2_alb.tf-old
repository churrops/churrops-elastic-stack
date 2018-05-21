resource "aws_alb" "loadbalancer" {
  name = "alb-${var.tag_name}"
  internal = false
  security_groups = ["${module.loadbalancer_sg.sg_id}"]
  subnets = ["subnet-0d2501ede51cebc3f", "subnet-0dde555767bd2a493"]
  enable_deletion_protection = false
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_alb_listener" "albListeners" {
  load_balancer_arn = "${aws_alb.loadbalancer.arn}"
  port = "${var.alb_listen_port}"
  protocol = "HTTP"
  default_action {
    target_group_arn = "${aws_alb_target_group.targetGroup.arn}"
    type = "forward"
  }
  lifecycle {
    create_before_destroy = true
  }
}
