variable "bucket_name" 		        { default = "terraform-state-laboratorio-dev" }
variable "sshkey_name"		        { default = "sshkey-neoassist-automacao" } 
variable "my_public_ip"		        { default = "200.194.112.198/32" }

variable "tag_environment"	   	    { default = "development" }
variable "tag_environment-short"   	{ default = "dev" }
variable "tag_application"		    { default = "elastic-stack" } 

/* # Master variables # */
variable "master_instance_count"    { default = "3" } 
variable "master_instance_name"     { default = "elasticsearch-masternode" }
variable "master_instance_type"     { default = "t2.medium" } 

/* # DataNode variables # */
variable "datanode_instance_count" 	{ default = "2" } 
variable "datanode_instance_name"	{ default = "elasticsearch-datanode" }
variable "datanode_instance_type" 	{ default = "t2.medium" } 

variable "root_volume_type" 		{ default = "gp2" }
variable "root_volume_size"		    { default = "30" }
variable "delete_on_termination"	{ default = "true" }

variable "ebs_device_name" 		    { default = "/dev/sde" }
variable "ebs_volume_size"		    { default = "10" }
variable "ebs_volume_type"			{ default = "gp2" }