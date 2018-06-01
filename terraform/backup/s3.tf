resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags {
    Name			= "${var.datanode_instance_name}"
    application		      	= "${var.tag_application}"
    elasticsearch	      	= "true"
    backup		      	= "true"
    terraform		        = "true"
    environment		      	= "${var.tag_environment}"
    environment-short 		= "${var.tag_environment-short}"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::elasticsearch-backup-teste"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject",
        "s3:DeleteObject"
      ],
      "Resource": ["arn:aws:s3:::elasticsearch-backup-teste/*"]
    }
  ]
}
EOF
}
