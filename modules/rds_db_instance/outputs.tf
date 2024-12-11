output "rds_instance_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = aws_db_instance.rds_instance_mysql.endpoint
}
