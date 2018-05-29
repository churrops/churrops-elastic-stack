terraform {
  backend "s3" {
    bucket  = "${var.bucket_name}"
    key     = "elasticsearch/elasticsearch.tfstate"
  }
}
