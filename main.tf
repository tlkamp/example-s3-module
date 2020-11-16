locals {
  is_prod         = var.environment == "prod"
  bucket_prefix   = "company-${var.environment}-${var.owner}"
  bucket_name     = join("-", list(local.bucket_prefix, var.bucket_name))
  storage_class   = local.is_prod ? "GLACIER" : "ONEZONE_IA"
  transition_days = local.is_prod ? 90 : 30
  expiration_days = local.is_prod ? 120 : 60
}

resource "aws_s3_bucket" "bucket" {
  bucket = local.bucket_name
  acl    = "private" // required

  versioning {
    enabled = var.versioned
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_id
        sse_algorithm     = var.encryption_algorithm
      }
    }
  }

  lifecycle_rule {
    enabled = true

    transition {
      days          = local.transition_days
      storage_class = local.storage_class
    }

    expiration {
      days = local.expiration_days
    }

    noncurrent_version_transition {
      storage_class = local.storage_class
      days          = local.transition_days
    }

    noncurrent_version_expiration {
      days = local.expiration_days
    }
  }

  tags = {
    Environment = var.environment
    Owner       = var.owner
  }
}