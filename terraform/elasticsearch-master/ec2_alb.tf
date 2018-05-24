resource "aws_alb" "loadbalancer" {
  name = "alb-${var.tag_name}"
  internal = false
  security_groups = ["${module.loadbalancer_sg.sg_id}"]
  subnets = ["subnet-0884729b2cc27a1b0", "subnet-0b095f2b17e6b5c90", "subnet-099afcd7f3d53bf58"]
  #subnets = ["${split(",", data.terraform_remote_state.vpc.public_subnets)}"]
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

resource "aws_alb_target_group" "targetGroup"{
  name = "tg-${var.tag_name}"
  port = "${var.app_listen_port}"
  protocol = "HTTP"
  vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
  health_check = {
    interval = "${var.hc_interval}"
    path = "${var.hc_path}"
    port = "${var.hc_port}"
    protocol = "${var.hc_protocol}"
    timeout = "${var.hc_timeout}"
    unhealthy_threshold = "${var.hc_unhealthy_threshold}"
    matcher = "${var.hc_matcher}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
