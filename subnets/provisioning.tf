
# Get the default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Create Private Subnet Olympus
resource "aws_subnet" "mervin_subnet_olympus" {
  vpc_id            = aws_default_vpc.default.id
  cidr_block        = var.subnet_cidr_olympus

  tags = {
    "Name" = "mervin_subnet_olympus"
    "CreatorName" = var.user_tag_creator
  }
}

# Create Private Subnet Sandbox
resource "aws_subnet" "mervin_subnet_sandbox" {
  vpc_id            = aws_default_vpc.default.id
  cidr_block        = var.subnet_cidr_sandbox

  tags = {
    "Name" = "mervin_subnet_sandbox"
    "CreatorName" = var.user_tag_creator
  }
}