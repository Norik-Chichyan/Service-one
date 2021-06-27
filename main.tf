provider "aws" {
  shared_credentials_file = "/Users/Norik/AppData/terraform.rc"
  region = "us-east-1"
   
}

module "service-one-module" {
  source = "./service-one-ec2"
  instance_type = "t2.micro"
  key_name = "aws-key2"
}