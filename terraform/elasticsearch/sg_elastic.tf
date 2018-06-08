resource "aws_security_group" "sg_elasticsearch" {
  name        = "sg_${var.tag_application}"
  description = "Security Group for ElasticStack"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["${var.my_public_ip}"]
  }

  ingress {
    from_port   = "9200"
    to_port     = "9399"
    protocol    = "tcp"
    self	= "true"
  }

  ingress {
    from_port   = "5601"
    to_port     = "5601"
    protocol    = "tcp"
    self        = "true"
  }

  ingress {
    from_port   = "8200"
    to_port     = "8200"
    protocol    = "tcp"
    self        = "true"
  }

   egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    Name		 	= "sg-${var.tag_application}"
    elasticsearch	      	= "true"
    terraform		        = "true"
    environment         	= "${var.tag_environment}"
    environment-short   	= "${var.tag_environment-short}"
  }
}
