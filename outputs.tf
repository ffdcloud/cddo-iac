output "ec2_instance_public_ip" {
  description = "Public IP of the EC2 instance server"
  value       = module.cddental_ec2_instance.public_ip
}

output "ec2_instance_public_dns" {
  description = "Public DNS of the EC2 instance server"
  value       = module.cddental_ec2_instance.public_dns
}

output "rds_instance_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = module.cddental_rds_db_instance.rds_instance_endpoint
}
