data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

module "ec2" {
  source = "../modules/terraform-aws-ec2-instance"

  instance_count	      = "2"
  name                        = "elasticsearch-datanode"
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "t2.medium"
  key_name		      = "sshkey-neoassist-automacao"
  user_data       	      = "${file("user-data.sh")}"
  subnet_id                   = "${element(data.aws_subnet_ids.all.ids, 0)}"
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]
  associate_public_ip_address = true

  root_block_device = [{
    volume_type = "gp2"
    volume_size = 40
    delete_on_termination = true
  }]

  ebs_block_device = [{
    device_name	= "/dev/sde"
    volume_type = "gp2"
    volume_size = 40
    delete_on_termination = true
  }]


  volume_tags { 
    Name		= "ebs-elasticsearch-datanode"
    application         = "elastic-stack"
    terraform           = "true"
    environment         = "development"
    environment-short   = "dev"
  } 
 
  tags { 
    Name		= "elasticsearch-datanode"
    application		= "elastic-stack"
    elasticsearch	= "true"
    masternode		= "false"
    datanode		= "true"
    logstash		= "false"
    terraform		= "true"
    environment		= "development"
    environment-short 	= "dev"
  }
}
