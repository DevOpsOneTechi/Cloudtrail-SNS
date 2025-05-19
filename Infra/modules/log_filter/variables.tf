variable "log_group_name" { type = string }

variable "filter_pattern" { type = string }

variable "metric_namespace" { type = string }

variable "metric_name" { type = string }

variable "alarm_actions" {
  description = "List of actions to trigger when alarm is triggered"
  type        = list(string)
}
