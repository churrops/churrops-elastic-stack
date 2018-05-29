module "ec2-mn" {
  source = "../modules/terraform-aws-ec2-instance"

  instance_count	            = "${var.master_instance_count}"
  name                        = "${var.master_instance_name}"
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "${var.master_instance_type}"
  key_name		                = "${var.sshkey_name}"
  user_data       	          = "${file("user-data.sh")}"
  subnet_id                   = "${element(data.aws_subnet_ids.all.ids, 0)}"
  vpc_security_group_ids      = ["${module.security_group.this_security_group_id}"]
  associate_public_ip_address = true

  root_block_device = [{
    volume_type               = "${var.root_volume_type}"
    volume_size               = "${var.root_volume_size}"
    delete_on_termination     = "${var.delete_on_termination}"
  }]

  volume_tags { 
    Name		            = "ebs-${var.master_instance_name}"
    application         = "${var.tag_application}"
    terraform           = "true"
    environment         = "${var.tag_environment}"
    environment-short   = "${var.tag_environment-short}"
  } 
 
  tags { 
    Name		            = "${var.master_instance_name}"
    application		      = "${var.tag_application}"
    elasticsearch	      = "true"
    masternode		      = "true"
    datanode		        = "false"
    terraform		        = "true"
    environment         = "${var.tag_environment}"
    environment-short   = "${var.tag_environment-short}"
  }
}
