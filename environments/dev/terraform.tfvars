region                    = "us-east-1"
trail_name                = "all-account-activity"
cloudwatch_log_group_name = "/aws/cloudtrail/all"
login_filter_pattern      = "{ $.eventName = \"ConsoleLogin\" && $.errorMessage = \"Successful\" }"
metric_namespace          = "LoginAlerts"
metric_name               = "SuccessfulConsoleLogins"
sns_topic_name            = "login-alerts-topic"
notification_emails       = [
  "techOps.buddy@gmail.com",
  "sbvh1437@gmail.com"
]
