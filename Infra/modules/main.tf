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

  arn                 = var.alarm_arn

  # Note: in Terraform you cannot attach actions to an existing alarm; recommend import or recreate in this module context

}