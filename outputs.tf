output "bucket_arn" {
  
  value = aws_s3_bucket.project_bucket.arn

}



output "user_name" {

  value = aws_iam_user.project_user.name

}
