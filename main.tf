# provision to ap-south-1 region
provider "aws" {
  region  = "ap-south-1"
}
resource "aws_instance" "app_server" {
  ami           = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  key_name      = "naveen"
tags = {
    Name = var.ec2_name
  }
}
