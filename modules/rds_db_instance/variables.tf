variable "identifier" {
  description = "The RDS db instance identifier"
  type        = string
}

variable "db_name" {
  description = "Name of RDS database"
  type        = string
}

variable "db_user" {
  description = "Name of RDS database user"
  type        = string
}

variable "db_password" {
  description = "Name of RDS database password"
  type        = string
}

variable "db_port" {
  description = "Value of RDS database port"
  type        = number
}

variable "rds_name" {
  description = "RDS Name tag"
  type        = string
}
