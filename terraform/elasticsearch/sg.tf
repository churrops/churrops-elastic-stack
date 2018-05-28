module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "elasticsearch"
  description = "security group for elasticsearch"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress_cidr_blocks = ["${var.my_public_ip}"]
  ingress_rules       = ["all-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}
