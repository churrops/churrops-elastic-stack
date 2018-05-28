data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "${var.bucket_name}"
    key = "vpc/vpc.tfstate"
  }
}

data "terraform_remote_state" "datanode" {
  backend = "s3"
  config = {
    bucket = "${var.bucket_name}"
    key = "elasticsearch/datanode.tfstate"
  }
}

data "terraform_remote_state" "masternode" {
  backend = "s3"
  config = {
    bucket = "${var.bucket_name}"
    key = "elasticsearch/masternode.tfstate"
  }
}

