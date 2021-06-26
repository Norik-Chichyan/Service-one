provider "aws" {
    region = "us-east-1"
   
}

module "service-one-module" {
  source = "./service-one-ec2"
  instance_type = "t2.micro"
  key_name = "aws-key2"
}