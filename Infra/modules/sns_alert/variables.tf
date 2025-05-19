variable "topic_name" { type = string }
variable "email_addresses" { type = list(string) }
variable "alarm_name" { type = string }
variable "alarm_arn" { type = string }
variable "comparison_operator" {
  description = "Comparison operator for CloudWatch alarm"
  type        = string
}

variable "evaluation_periods" {
  description = "Number of periods for alarm evaluation"
  type        = number
}

variable "metric_name" {
  description = "The name of the CloudWatch metric"
  type        = string
}

variable "metric_namespace" {
  description = "The namespace for the CloudWatch metric"
  type        = string
}
