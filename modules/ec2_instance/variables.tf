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
