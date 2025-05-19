resource "aws_s3_bucket" "cloudtrail_logs" {
  bucket = var.bucket_name
  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.cloudtrail_logs.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_policy" "cloudtrail_policy" {
  bucket = aws_s3_bucket.cloudtrail_logs.id
  policy = data.aws_iam_policy_document.cloudtrail_s3_policy.json
}

data "aws_iam_policy_document" "cloudtrail_s3_policy" {
  statement {
    sid = "AWSCloudTrailWrite"

    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl", # Bucket-level action
      "s3:PutObject"     # Object-level action
    ]

    resources = [
      aws_s3_bucket.cloudtrail_logs.arn,        # For s3:GetBucketAcl
      "${aws_s3_bucket.cloudtrail_logs.arn}/*" # For s3:PutObject
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }
}
