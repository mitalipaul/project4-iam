variable "bucket_name" {
  
  type = string

  description = "A globally unique name for your S3 bucket"

  default = "mitali-project4-bucket-2026"

}



variable "iam_user_name" {

  type = string

  default = "mitali-project4-s3-readonly-user"

}
