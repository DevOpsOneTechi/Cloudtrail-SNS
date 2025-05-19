variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

 
variable "trail_name" {
  description = "Name of the CloudTrail trail"
  type        = string
  default     = "all-account-activity"
}

variable "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch Log Group for CloudTrail"
  type        = string
  default     = "/aws/cloudtrail/all"
}

 
variable "login_filter_pattern" {
  description = "Filter pattern to detect AWS Console login events"
  type        = string
  default     = "{ $.eventName = \"ConsoleLogin\" && $.errorMessage = \"Successful\" }"
}

 

variable "metric_namespace" {
  description = "CloudWatch metric namespace"
  type        = string
  default     = "LoginAlerts"
}

 

variable "metric_name" {
  description = "CloudWatch metric name for login events"
  type        = string
  default     = "SuccessfulConsoleLogins"
}

 

variable "sns_topic_name" {
  description = "SNS Topic name for alerts"
  type        = string
  default     = "login-alerts-topic"
}

 

variable "notification_emails" {
  description = "List of emails to notify"
  type        = list(string)
}

variable "s3_bucket_name" {
  description = "The S3 bucket where CloudTrail logs will be stored"
  type        = string
  value       = "cloud-trail-bucket"
}

