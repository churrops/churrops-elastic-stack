terraform {
  backend "s3" {
    bucket  = "terraform-state-laboratorio-dev"
    key     = "elasticsearch-master/master.tfstate"
  }
}
