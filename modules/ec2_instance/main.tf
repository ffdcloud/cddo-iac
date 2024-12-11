data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = "dental-ec2-security-group"
  description = "Security group for Calgary Downtown Dental Office EC2 instance"

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_pair_name

  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  user_data_replace_on_change = true
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y

    sudo yum install git -y

    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd

    sudo yum install aws-cli unzip -y

    sudo yum -y install ruby
    sudo yum -y install wget
    cd /home/ec2-user
    wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
    sudo chmod +x ./install
    sudo ./install auto
  EOF

  tags = {
    Name = var.ec2_name
  }
}
