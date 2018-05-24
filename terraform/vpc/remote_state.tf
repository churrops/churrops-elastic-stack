terraform {
  backend "s3" {
    bucket  = "terraform-state-laboratorio-dev"
    key     = "vpc/vpc.tfstate"
  }
}
