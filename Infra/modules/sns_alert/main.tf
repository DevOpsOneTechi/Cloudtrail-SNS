resource "aws_sns_topic" "alerts" {
  name = var.topic_name
}

 

resource "aws_sns_topic_subscription" "emails" {
  for_each = toset(var.email_addresses)
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = each.value

}

 

resource "aws_cloudwatch_metric_alarm" "attach_sns" {
  alarm_name          = var.alarm_name
  alarm_actions       = [aws_sns_topic.alerts.arn]
  comparison_operator = "GreaterThanOrEqualToThreshold"  # Example value
  evaluation_periods  = 1  # Example value
  threshold           = 1  # Adjust as needed
  metric_name         = var.metric_name
  namespace           = var.metric_namespace
  statistic           = "Sum"
  period              = 300
}

