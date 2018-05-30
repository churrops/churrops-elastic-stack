data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}


data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "${var.bucket_name_vpc}"
    key     = "vpc/vpc.tfstate"
  }
}

data "terraform_remote_state" "datanode" {
  backend = "s3"
  config = {
    bucket  = "${var.bucket_name_elastic}"
    key     = "elasticsearch/datanode.tfstate"
  }
}

data "terraform_remote_state" "masternode" {
  backend = "s3"
  config = {
    bucket  = "${var.bucket_name_elastic}"
    key     = "elasticsearch/masternode.tfstate"
  }
}
