resource "aws_cloudwatch_log_group" "ct_logs" {
  name              = var.cw_log_group_name
  retention_in_days = 90
}

 

resource "aws_iam_role" "ct_role" {
  name = "cloudtrail-cloudwatch-logs-role"
  assume_role_policy = data.aws_iam_policy_document.ct_assume.json

}

 

data "aws_iam_policy_document" "ct_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
  }
}

 

resource "aws_iam_role_policy" "ct_policy" {
  name   = "cloudtrail-logs-policy"
  role   = aws_iam_role.ct_role.id
  policy = data.aws_iam_policy_document.ct_policy.json

}

data "aws_iam_policy_document" "ct_policy" { 
statement {
  actions = [
    "logs:CreateLogStream",
    "logs:PutLogEvents"
  ]
  resources = [
    aws_cloudwatch_log_group.ct_logs.arn,
    "${aws_cloudwatch_log_group.ct_logs.arn}:*"
  ]
}


 

resource "aws_cloudtrail" "trail" {
  name                          = var.trail_name
  is_multi_region_trail         = true
  include_global_service_events = true
  enable_logging                = true
  cloud_watch_logs_role_arn     = aws_iam_role.ct_role.arn
  cloud_watch_logs_group_arn    = aws_cloudwatch_log_group.ct_logs.arn
  s3_bucket_name = var.s3_bucket_name
}

