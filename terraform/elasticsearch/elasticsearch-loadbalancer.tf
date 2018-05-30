resource "aws_elb" "elb-elasticsearch" {
  name               	= "elb-${var.tag_environment-short}-${var.tag_application}"
  subnets 		= ["${data.aws_subnet_ids.all.ids}"]
  security_groups 	= ["${aws_security_group.sg_elasticsearch.id}"]
  internal		= "false"

  instances                   = ["${module.ec2-mn.id}"]
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400
  idle_timeout                = 400

  listener {
    instance_port     = "9200"
    instance_protocol = "http"
    lb_port           = "80"
    lb_protocol       = "http"
  }

  health_check {
    target              = "HTTP:9200/_cluster/health"
    healthy_threshold   = 10
    unhealthy_threshold = 10
    timeout             = 60
    interval            = 300
  }

  tags {
    Name 			= "elb-${var.tag_application}"
    elasticsearch	      	= "true"
    terraform		        = "true"
    environment         	= "${var.tag_environment}"
    environment-short   	= "${var.tag_environment-short}"
  }
}

