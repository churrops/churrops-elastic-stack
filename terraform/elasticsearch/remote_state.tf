terraform {
  backend "s3" {
    bucket = "neoassist-terraform-state-elastic-dev"
    encrypt = "true"
    key    = "elasticsearch/elasticsearch.tfstate"
    region = "us-east-1"
  }
}
