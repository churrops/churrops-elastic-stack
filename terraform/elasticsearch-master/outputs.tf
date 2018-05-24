output "loadbalancer" {
  value = "${aws_alb.loadbalancer.dns_name}"
}
