terraform {
        required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
}
}
required_version = ">= 1.2.0"
}

provider "aws" {
        region = "us-east-1"
}

locals {
	instances = {"raki":"ami-08a52ddb321b32a8c","usr":"ami-053b0d53c279acc90","gty":"ami-053b0d53c279acc90","game":"ami-08a52ddb321b32a8c"}
}

resource "aws_instance" "aws_ec2_test" {
	for_each = local.instances
	ami = each.value
	instance_type = "t2.micro"
	tags = {
    Name = each.key
  }
}
