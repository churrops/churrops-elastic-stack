output "id-masternode" {
  description = "List of IDs of instances"
  value       = ["${module.ec2-mn.id}"]
}
output "id-datanode" {
  description = "List of IDs of instances"
  value       = ["${module.ec2-mn.id}"]
}

output "public_dns-masternode" {
  description = "List of public DNS names assigned to the instances"
  value       = ["${module.ec2-mn.public_dns}"]
}
output "public_dns-datanode" {
  description = "List of public DNS names assigned to the instances"
  value       = ["${module.ec2-mn.public_dns}"]
}

output "instance_id-masternode" {
  description = "EC2 instance ID"
  value       = "${module.ec2-mn.id[0]}"
}
output "instance_id-datanode" {
  description = "EC2 instance ID"
  value       = "${module.ec2-mn.id[0]}"
}

output "instance_public_dns-masternode" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = "${module.ec2-mn.public_dns[0]}"
}
output "instance_public_dns-datanode" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = "${module.ec2-mn.public_dns[0]}"
}
