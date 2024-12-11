variable "codepipeline_service_role_arn" {
  description = "The ARN of the IAM role for CodePipeline."
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket where source artifacts are stored."
  type        = string
}

variable "source_object_key" {
  description = "Path to the source artifact in the S3 bucket."
  type        = string
}

variable "application_name" {
  description = "Name of the application for CodeDeploy and CodePipeline."
  type        = string
}