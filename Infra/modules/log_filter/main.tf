resource "aws_cloudwatch_metric_alarm" "login_alarm" {

  alarm_name  = "ConsoleLoginAlarm"
  alarm_description   = "Alarm on successful console login events"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  threshold           = 1
  metric_name         = var.metric_name
  namespace           = var.metric_namespace
  statistic           = "Sum"
  period              = 300
  alarm_actions = var.alarm_actions

}

 

resource "aws_cloudwatch_log_metric_filter" "login_filter" {
  name           = "login-metric-filter"
  log_group_name = var.log_group_name
  pattern        = var.filter_pattern

 
  metric_transformation {
    name      = var.metric_name
    namespace = var.metric_namespace
    value     = "1"
  }
}
