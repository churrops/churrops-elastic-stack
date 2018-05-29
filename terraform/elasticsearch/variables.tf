variable "bucket_name" 		        { default = "" }
variable "sshkey_name"		        { default = "" } 
variable "my_public_ip"		        { default = "" }
variable "associate_public_ip_address"	{ default = "true" }
variable "disable_api_termination"	{ default = "true" }

variable "tag_application"		{ default = "elastic-stack" } 
variable "tag_environment"	  	{ default = "development" }
variable "tag_environment-short"   	{ default = "dev" }

/* #=> Master variables <=# */
variable "master_instance_count"    	{ default = "3" } 
variable "master_instance_name"     	{ default = "elasticsearch-masternode" }
variable "master_instance_type"     	{ default = "t2.small" } 

/* #=> DataNode variables <=# */
variable "datanode_instance_count" 	{ default = "2" } 
variable "datanode_instance_name"	{ default = "elasticsearch-datanode" }
variable "datanode_instance_type" 	{ default = "t2.medium" } 

/* #=> Root Disk <=# */
variable "root_volume_type" 		{ default = "gp2" }
variable "root_volume_size"		{ default = "30" }
variable "root_delete_on_termination"	{ default = "true" }

/* #=> EBS Disk <=# */
variable "ebs_device_name"		{ default = "/dev/sde" }
variable "ebs_volume_size"		{ default = "40" }
variable "ebs_volume_type"		{ default = "gp2" }
variable "ebs_delete_on_termination"	{ default = "true" }
