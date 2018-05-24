variable "bucket_name" 	 	      { default = "terraform-state-laboratorio-dev" }
variable "tag_name"                    { default = "elasticmaster" }
variable "instance_count" 	       { default = "1" }
variable "region" 	 	       { default = "us-east-1" } 
variable "instance_type" 	       { default = "m5.large" }
variable "ami" 			       { default = "ami-d5bf2caa" }
variable "user_data" 	 	       { default = "" }
variable "ssh_key_pair" 	       { default = "sshkey-neoassist-automacao" }
variable "source_dest_check" 	       { default = "true" }
variable "vpc_id" 		       { default = "" }
variable "subnet" 		       { default = "" }
variable "availability_zone" 	       { default = "" }
variable "associate_public_ip_address" { default = "true" }
variable "root_volume_size" 	       { default = "50" }
variable "root_volume_type" 	       { default = "gp2" }
variable "root_iops" 		       { default = "0" }
variable "instance_enabled" 	       { default = "true" }
variable "vpc_security_group_ids"      { default = "" }

variable "security_groups" {
  description = "List of Security Group IDs allowed to connect to the instance"
  type        = "list"
  default     = []
}

variable "allowed_ports" {
  type        = "list"
  description = "List of allowed ingress ports"
  default     = []
}

variable "tags" {
  description = "Additional tags"
  type        = "map"
  default     = {}
}

variable "ebs_optimized" { default = "false" }
variable "disable_api_termination" { default = "false" }
variable "monitoring" { default = "true" }

variable "private_ip" {
  description = "Private IP address to associate with the instance in the VPC"
  default     = ""
}

variable "ebs_volume_type" 		{ default = "gp2" }
variable "ebs_volume_size" 		{ default = "10" }
variable "ebs_iops" 			{ default = "0" }
variable "ebs_volume_count" 		{ default = "0" }
variable "delete_on_termination" 	{ default = "true" }

variable "ebs_device_name" {
  type        = "list"
  description = "Name of the EBS device to mount"
  default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
}

variable "create_default_security_group" {
  description = "Create default Security Group with only Egress traffic allowed"
  default     = "true"
}

variable "app_listen_port"        { default = "9200" }
variable "alb_listen_port"        { default = "80" }
variable "hc_interval"            { default = "15" }
variable "hc_path"                { default = "/" }
variable "hc_port"                { default = "traffic-port" }
variable "hc_protocol"            { default = "HTTP" }
variable "hc_timeout"             { default = "3" }
variable "hc_unhealthy_threshold" { default = "2" }
variable "hc_matcher"             { default = "200" }

