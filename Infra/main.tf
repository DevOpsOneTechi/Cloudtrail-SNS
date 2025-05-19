module "cloudtrail" {
  source              = "./modules/cloudtrail"
  trail_name          = var.trail_name
  cw_log_group_name   = var.cloudwatch_log_group_name
  s3_bucket_name = var.s3_bucket_name
}

 

module "log_filter" {
  source            = "./modules/log_filter"
  log_group_name    = module.cloudtrail.log_group_name
  filter_pattern    = var.login_filter_pattern
  metric_namespace  = var.metric_namespace
  metric_name       = var.metric_name
}

 

module "sns_alert" {
  source          = "./modules/sns_alert"
  topic_name      = var.sns_topic_name
  email_addresses = var.notification_emails
  alarm_name      = module.log_filter.alarm_name
  alarm_arn       = module.log_filter.alarm_arn
}

