variable "trail_name" {
  type = string
}


variable "cw_log_group_name" {
  type = string
}

variable "s3_bucket_name" {
  description = "The S3 bucket where CloudTrail logs will be stored"
  type        = string
}
