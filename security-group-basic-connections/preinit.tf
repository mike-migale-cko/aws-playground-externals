# AWS Specific variables
variable "aws_access_key" {}
variable "aws_secret_access_key" {}
variable "aws_region" {}

# Remote Specific Variables
variable "remote_public_ip_connectivity" {
    type = list(string)
    description = "List of Ingress Ports in Linux"
}

# User Specific Variables
variable "user_tag_creator" {}

# Ports List
variable "sg_ports_ingress_linux" {
    type = list(number)
    description = "List of Ingress Ports in Linux"
}

variable "sg_ports_ingress_windows" {
    type = list(number)
    description = "List of Ingress Ports in Windows"
}

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