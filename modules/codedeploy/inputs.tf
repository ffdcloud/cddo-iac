variable "application_name" {
  type        = string
}

variable "ec2_instance_name" {
  type        = string
}

variable "codedeploy_service_role_arn" {
  description = "Name of EC2 instance"
  type        = string
}
