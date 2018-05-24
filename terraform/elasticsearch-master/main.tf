data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "${var.bucket_name}"
    key = "vpc/vpc.tfstate"
  }
}
