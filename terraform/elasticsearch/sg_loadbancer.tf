resource "aws_security_group" "sg-elb-elasticsearch" {
  name        = "sg_elb_${var.tag_application}"
  description = "Security Group for ElasticStack"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["${var.my_public_ip}"]
  }

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["${var.my_public_ip}"]
  }

  ingress {
    from_port   = "5601"
    to_port     = "5601"
    protocol    = "tcp"
    cidr_blocks = ["${var.my_public_ip}"]
  }

  ingress {
    from_port   	= "80"
    to_port     	= "80"
    protocol    	= "tcp"
    security_groups 	= ["${aws_security_group.sg_elasticsearch.id}"]
  }

  ingress {
    from_port           = "443"
    to_port             = "443"
    protocol            = "tcp"
    security_groups     = ["${aws_security_group.sg_elasticsearch.id}"]
  }

  ingress {
    from_port           = "8200"
    to_port             = "8200"
    protocol            = "tcp"
    security_groups     = ["${aws_security_group.sg_elasticsearch.id}"]
  }

   egress {
    from_port       	= 0
    to_port         	= 0
    protocol        	= "-1"
    cidr_blocks     	= ["0.0.0.0/0"]
  }

  tags {
    Name		= "sg-elb-${var.tag_application}"
    elasticsearch	= "true"
    terraform		= "true"
    environment         = "${var.tag_environment}"
    environment-short   = "${var.tag_environment-short}"
  }
}
