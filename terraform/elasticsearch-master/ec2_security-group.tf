module "instances_sg" {
  source   = "../modules/aws_security_group"
  vpc_id   = "${data.terraform_remote_state.vpc.vpc_id}"
  tag_name = "sg_${var.tag_name}"
}

module "loadbalancer_sg" {
  source   = "../modules/aws_security_group"
  vpc_id   = "${data.terraform_remote_state.vpc.vpc_id}"
  tag_name = "sg_alb_${var.tag_name}"
}

resource "aws_security_group_rule" "allow_connections_to_alb" {
  type              = "ingress"
  from_port         = "${var.alb_listen_port}"
  to_port           = "${var.alb_listen_port}"
  protocol          = "tcp"
  cidr_blocks       = ["200.194.112.198/32"]
#  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${module.loadbalancer_sg.sg_id}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "allow_connections_from_alb" {
  type                     = "ingress"
  from_port                = "${var.app_listen_port}"
  to_port                  = "${var.app_listen_port}"
  protocol                 = "tcp"
  source_security_group_id = "${module.loadbalancer_sg.sg_id}"
  security_group_id        = "${module.instances_sg.sg_id}"
  lifecycle {
    create_before_destroy = true
  }
}
