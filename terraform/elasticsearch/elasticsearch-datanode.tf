module "ec2-dn" {
  source = "../modules/terraform-aws-ec2-instance"

  instance_count	     	= "${var.datanode_instance_count}"
  name                        	= "${var.datanode_instance_name}"
  ami                         	= "${data.aws_ami.centos.id}"
  instance_type               	= "${var.datanode_instance_type}"
  key_name		        = "${var.sshkey_name}"
  user_data       	        = "${file("user-data.sh")}"
  subnet_id                  	= "${element(data.aws_subnet_ids.all.ids, 0)}"
  vpc_security_group_ids      	= ["${module.security_group.this_security_group_id}"]
  associate_public_ip_address 	= "${var.associate_public_ip_address}"
  disable_api_termination	= "${var.disable_api_termination}"


  root_block_device = [{
    volume_type           	= "${var.root_volume_type}"
    volume_size           	= "${var.root_volume_size}"
    delete_on_termination 	= "${var.root_delete_on_termination}"
  }]

  ebs_block_device = [{
    device_name	          	= "${var.ebs_device_name}"
    volume_type           	= "${var.ebs_volume_type}"
    volume_size           	= "${var.ebs_volume_size}"
    delete_on_termination 	= "${var.ebs_delete_on_termination}"
  }]

  volume_tags { 
    Name			= "ebs-${var.datanode_instance_name}"
    application         	= "${var.tag_application}"
    terraform           	= "true"
    environment         	= "${var.tag_environment}"
    environment-short   	= "${var.tag_environment-short}"
  } 
 
  tags { 
    Name			= "${var.datanode_instance_name}"
    application		      	= "${var.tag_application}"
    elasticsearch	      	= "true"
    masternode		      	= "false"
    datanode		        = "true"
    terraform		        = "true"
    environment		      	= "${var.tag_environment}"
    environment-short 		= "${var.tag_environment-short}"
  }
}
