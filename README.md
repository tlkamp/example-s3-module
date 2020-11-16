[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/) 


# terraform-s3-bucket
A Terraform module that builds compliant AWS S3 Buckets.

## Input
| Variable             | Type   | Default | Required | Description                                                             |
|----------------------|--------|---------|----------|-------------------------------------------------------------------------|
| bucket_name          | string | N/A     | Yes      | The name of the bucket.                                                 |
| versioned            | bool   | false   | No       | Enable versioning on the bucket.                                        |
| encryption_algorithm | string | "AES25" | Yes      | The encryption algorithm for the bucket. AES256 or aws:kms.             |
| kms_key_id           | string | null    | No       | The KMS key to use for encryption when the bucket is aws:kms encrypted. |
| environment          | string | "dev"   | Yes      | The technology environment this bucket is associated with. Dev or Prod. |
| owner                | string | N/A     | Yes      | The owner of the bucket.                                                |

## Output
| Name   | Type   | Description                  |
|--------|--------|------------------------------|
| bucket | object | The resultant AWS S3 Bucket. |