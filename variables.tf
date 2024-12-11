variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "github_repo_url" {
  description = "GitHub repository URL to clone"
  type        = string
}

variable "ec2_name" {
  description = "Name of EC2 instance"
  type        = string
}

variable "rds_identifier" {
  description = "The RDS database instance identifier"
  type        = string
}

variable "rds_db_name" {
  description = "Name of RDS database"
  type        = string
}

variable "rds_db_user" {
  description = "Name of RDS database user"
  type        = string
}

variable "rds_db_password" {
  description = "Name of RDS database"
  type        = string
}

variable "rds_db_port" {
  description = "Value of RDS database port"
  type        = number
}

variable "rds_name_tag" {
  description = "Value of RDS name tag"
  type        = string
}