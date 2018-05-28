module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "elasticsearch-datanode"
  description = "security group for elasticsearch-datanode"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress_cidr_blocks = ["200.194.112.198/32"]
  ingress_rules       = ["all-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

