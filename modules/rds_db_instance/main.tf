resource "aws_db_instance" "rds_instance_mysql" {
  identifier              = var.identifier
  engine                  = "mysql"
  engine_version          = "8.0.39"
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20
  db_name                 = var.db_name
  username                = var.db_user
  password                = var.db_password
  vpc_security_group_ids  = [aws_security_group.rds_security_group.id]
  publicly_accessible     = true
  skip_final_snapshot     = true
  port                    = var.db_port

  tags = {
    Name = var.rds_name
  }
}

resource "aws_security_group" "rds_security_group" {
  name        = "cddental-rds-security-group"
  description = "Security group for RDS MySQL instance"
  vpc_id      = "vpc-551dcc28"

  ingress {
    description = "Allow MySQL access"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
