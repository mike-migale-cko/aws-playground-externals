
# Secret Access Keys to conenct to AWS Console
variable "aws_access_key" {}
variable "aws_secret_access_key" {}
variable "aws_region" {}

variable "user_tag_creator" {}

# Subnets
variable "subnet_cidr_olympus" {}
variable "subnet_cidr_sandbox" {}

# Require the providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.33.0"
    }
  }
}


# AWS Provider
provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_access_key
    region = var.aws_region
}