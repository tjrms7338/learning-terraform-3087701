data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "blog" {
  ami                    = data.aws_ami.app_ami.id
  region                 = "us-east-1"
  instance_type          = var.instance_type
  vpc_security_group_ids = ["sg-0bb56c6c"]
  tags = {
    Name = "Learning Terraform"
  }
}
