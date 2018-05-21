provider "aws" {
  region = "${var.region}"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "${var.region}"
    bucket = "${var.bucket_name}"
    key = "vpc/vpc.tfstate"
  }
}

