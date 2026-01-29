provider "aws" {

  region = "us-west-1"

}



# Create S3 Bucket

resource "aws_s3_bucket" "project_bucket" {

  bucket = var.bucket_name

}



# Create IAM User

resource "aws_iam_user" "project_user" {

  name = var.iam_user_name

}

# Create IAM Policy

resource "aws_iam_policy" "s3_read_policy" {

  name = "${var.iam_user_name}-policy"

  description = "Read-only access to ${var.bucket_name}"



  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = ["s3:ListBucket"]

        Resource = [aws_s3_bucket.project_bucket.arn]

      },

      {

        Effect = "Allow"

        Action = ["s3:GetObject"]

        Resource = ["${aws_s3_bucket.project_bucket.arn}/*"]

      }

    ]

  })

}
     
# Attach Policy to User

resource "aws_iam_user_policy_attachment" "policy_attach" {

  user = aws_iam_user.project_user.name

  policy_arn = aws_iam_policy.s3_read_policy.arn

}
