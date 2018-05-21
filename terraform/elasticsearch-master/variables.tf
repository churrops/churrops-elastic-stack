variable "bucket_name" 	 	{ default = "terraform-state-laboratorio-dev" }
variable "region" 	 	{ default = "us-east-1" } 
variable "instance_type" 	{ default = "t2.micro" }
variable "instance_count" 	{ default = "1" }
variable "ami" 			{ default = "" }
variable "user_data" 	 	{ default = "" }
variable "ssh_key_pair" 	{ default = "" }
variable "root_volume_size" 	{ default = "50" }

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  default     = "true"
}

variable "assign_eip_address" {
  description = "Assign an Elastic IP address to the instance"
  default     = "true"
}

variable "vpc_id" {
  description = "The ID of the VPC that the instance security group belongs to"
}

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

variable "subnet" {
  description = "VPC Subnet ID the instance is launched in"
}

variable "delimiter" {
  default = "-"
}

variable "attributes" {
  description = "Additional attributes (e.g. `policy` or `role`)"
  type        = "list"
  default     = []
}

variable "tags" {
  description = "Additional tags"
  type        = "map"
  default     = {}
}

variable "availability_zone" {
  description = "Availability Zone the instance is launched in. If not set, will be launched in the first AZ of the region"
  default     = ""
}


variable "ebs_optimized" { default = "false" }
variable "disable_api_termination" { default = "false" }
variable "monitoring" { default = "true" }

variable "private_ip" {
  description = "Private IP address to associate with the instance in the VPC"
  default     = ""
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs"
  default     = "true"
}

variable "root_volume_type" { default = "gp2" }
variable "root_iops" { default = "0" }

variable "ebs_device_name" {
  type        = "list"
  description = "Name of the EBS device to mount"
  default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
}

variable "ebs_volume_type" 	{ default = "gp2" }
variable "ebs_volume_size" 	{ default = "10" }
variable "ebs_iops" 		{ default = "0" }

variable "ebs_volume_count" {
  description = "Count of EBS volumes that will be attached to the instance"
  default     = "0"
}

variable "delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
  default     = "true"
}

variable "create_default_security_group" {
  description = "Create default Security Group with only Egress traffic allowed"
  default     = "true"
}

variable "instance_enabled" {
  description = "Flag to control the instance creation. Set to false if it is necessary to skip instance creation"
  default     = "true"
}
