resource "aws_instance" "elasticsearch-master" {
  count                       = "${var.instance_count}"
  ami                         = "${var.ami}"
#  availability_zone           = "${local.availability_zone}"
  instance_type               = "${var.instance_type}"
  ebs_optimized               = "${var.ebs_optimized}"
  disable_api_termination     = "${var.disable_api_termination}"
  user_data                   = "${var.user_data}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key_name                    = "${var.ssh_key_pair}"
  subnet_id                   = "${var.subnet}"
  monitoring                  = "${var.monitoring}"
#  private_ip                  = "${var.private_ip}"
  source_dest_check           = "${var.source_dest_check}"

#  vpc_security_group_ids

  root_block_device {
    volume_type           = "${var.root_volume_type}"
    volume_size           = "${var.root_volume_size}"
    iops                  = "${var.root_iops}"
    delete_on_termination = "${var.delete_on_termination}"
  }

  tags { 
    application		= "elastic-stack"
    elasticsearch	= "true"
    masternode		= "true"
    datanode		= "false"
    logstash		= "false"
    terraform		= "true"
    environment		= "development"
    environment-short 	= "dev"
  }


}

#resource "aws_ebs_volume" "default" {
#  count             = "${var.ebs_volume_count}"
#  availability_zone = "${local.availability_zone}"
#  size              = "${var.ebs_volume_size}"
#  iops              = "${local.ebs_iops}"
#  type              = "${var.ebs_volume_type}"

#  tags { 
#     application         = "elastic-stack"
#     elasticsearch       = "true"
#     masternode          = "true"
#     datanode            = "false"
#     logstash            = "false"
#     terraform           = "true"
#     environment         = "development"
#     environment-short   = "dev"
#}
#
#resource "aws_volume_attachment" "default" {
#  count       = "${var.ebs_volume_count}"
#  device_name = "${element(var.ebs_device_name, count.index)}"
#  volume_id   = "${element(aws_ebs_volume.elasticsearch-master.*.id, count.index)}"
#  instance_id = "${aws_instance.elasticsearch-master.id}"
#}
