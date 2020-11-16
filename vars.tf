variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "versioned" {
  type        = bool
  description = "Enable versioning on the S3 bucket"
  default     = false
}

variable "encryption_algorithm" {
  type        = string
  description = "Encryption algorithm. aws:kms or AES256"
  default     = "AES256"
}

variable "kms_key_id" {
  type        = string
  description = "KMS Key ID to use with aws:kms encryption"
  default     = null
}

variable "environment" {
  type        = string
  description = "The technology environment this bucket is associated with."
  default     = "dev"
}

variable "owner" {
  type        = string
  description = "The owner of the bucket"
}