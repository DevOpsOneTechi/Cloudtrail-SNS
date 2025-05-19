variable "bucket_name" {
  description = "Name of the S3 bucket for CloudTrail logs"
  type        = string
}

 

variable "environment" {
  description = "Environment tag (e.g., dev, prod)"
  type        = string
  default     = "dev"
}
