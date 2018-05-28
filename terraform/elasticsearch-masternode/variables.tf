variable "bucket_name" 		{ default = "terraform-state-laboratorio-dev" } 

variable "root_volume_type" 	{ default = "gp2" }
variable "root_volume_size"	{ default = "30" }
variable "delete_on_termination"{ default = "true" }

variable "ebs_device_name" 	{ default = "/dev/sde" }
variable "ebs_volume_size"	{ default = "10" }
variable "ebs_volume_type"	{ default = "gp2" }
