# AWS Specific variables
variable "aws_access_key" {}
variable "aws_secret_access_key" {}
variable "aws_region" {}

# Remote Specific Variables
variable "ip_subnet_priv_block" {}

# User Specific Variables
variable "user_tag_creator" {}

# Ports List
variable "sg_ports_ingress_linux" {
    type = list(number)
    description = "List of Ingress Ports in Linux"
}

variable "sg_ports_ingress_windows_tcp" {
    type = list(number)
    description = "List of Ingress TCP Ports in Windows"
}

variable "sg_ports_ingress_windows_udp" {
    type = list(number)
    description = "List of Ingress UDP Ports in Windows"
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

# Get public IP
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
