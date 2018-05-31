# Ansible ElasticSearch - EM DESENVOLVIMENTO

<strong>Author:</strong> Rodrigo Floriano de Souza <floriancomercial@gmail.com>
<strong>Blog:</strong> 

# TERRAFORM

## Pre-requisites

- git 2.7.x or later
- aws-cli 1.14.x or later
- terraform v0.10.x or later

## Features

- 1 AWS ELB for access to Elasticsearch API in Port 9200
- 1 AWS Security Group for Loadbalancer
- 1 AWS Security Group for EC2 Instances
- 1 or more AWS EC2 Instances "elasticsearch-masternode"
- 1 or more AWS EC2 Instances "elasticsearch-datanode" with additional EBS Disk for data.

## HOW TO EXECUTE

### Install and configure awscli

```
aws configure --profile acme

export AWS_DEFAULT_REGION=us-east-1
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile acme)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile acme)
```

### Download the project

```
git clone https://github.com/churrops/churrops-elastic-stack.git
```

### Configuration of Variables 

```
cd terraform/elasticsearch/
```

```
vim terraform.tfvars

bucket_name_vpc			= "AWS S3 BUCKET NAME FOR TERRAFORM STATE"
bucket_name_elastic		= "AWS S3 BUCKET NAME FOR TERRAFORM STATE"
sshkey_name			= "AWS SSHKEY NAME"
my_public_ip			= "YOUR PUBLIC IP ADDRESS"
associate_public_ip_address	= "true"
disable_api_termination		= "false"

tag_environment			= "development"
tag_environment-short		= "dev"

master_instance_count		= "1"
master_instance_name		= "elasticsearch-masternode"
master_instance_type		= "t2.small"

datanode_instance_count 	= "1"
datanode_instance_name		= "elasticsearch-datanode"
datanode_instance_type		= "t2.medium"

root_volume_type		= "gp2"
root_volume_size		= "30"
root_delete_on_termination	= "true"

ebs_device_name			= "/dev/sde"
ebs_volume_size			= "40"
ebs_volume_type			= "gp2"
ebs_delete_on_termination	= "true"
```

### Run Terraform

```
terraform init
terraform plan
terraform apply
```
