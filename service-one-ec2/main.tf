terraform {
  required_version = ">= 0.12"
  
  }

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
resource "aws_instance" "service_one" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name

  }

resource "null_resource" "ansible-run" {
 provisioner "local-exec" {
    command = "ansible-playbook -i inventory consul.yml"
 }