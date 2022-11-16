# provision to ap-south-1 region
provider "aws" {
  region  = "ap-south-1"
}
resource "aws_instance" "app_server" {
  ami           = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  key_name      = "naveen"
  vpc_security_group_ids = [
    "sg-0f6b406cfcc00712f"
  ]
  user_data = <<EOF
#!/bin/bash
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -G wheel ec2-user  
chmod 666 /var/run/docker.sock
usermod -aG docker ec2-user  
EOF
  
tags = {
    Name = var.ec2_name
  }
}
