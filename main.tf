provider "aws" {
  region = var.aws_region
}

module "cddental_ec2_instance" {
  source = "./modules/ec2_instance"

  key_pair_name   = var.key_pair_name
  github_repo_url = var.github_repo_url
  ec2_name        = var.ec2_name
}

module "cddental_rds_db_instance" {
  source = "./modules/rds_db_instance"

  identifier = var.rds_identifier
  db_name    = var.rds_db_name
  db_user    = var.rds_db_user
  db_password = var.rds_db_password
  db_port     = var.rds_db_port
  rds_name    = var.rds_name_tag
}
