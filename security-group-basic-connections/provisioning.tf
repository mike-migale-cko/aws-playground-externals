
# Get the default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Create a Security Group for Unix
resource "aws_security_group" "mervin_basic_connectivity_linux" {
  
  name = "mervin_basic_connectivity_linux"
  vpc_id = aws_default_vpc.default.id

  # Inbound connections
  dynamic "ingress"{

    for_each = var.sg_ports_ingress_linux

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.remote_public_ip_connectivity
    }
  }

  ingress {
    protocol = "icmp"
    from_port = 8
    to_port = 0
    cidr_blocks = var.remote_public_ip_connectivity
  }
  
  # Outbound connections
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # Setup tags for finding it easily
  tags = {
    "Name" = "mervin_basic_connectivity_linux"
    "CreatorName" = var.user_tag_creator
  }
}

# Create a Security Group for Windows
resource "aws_security_group" "mervin_basic_connectivity_windows" {
  
  name = "mervin_basic_connectivity_windows"
  vpc_id = aws_default_vpc.default.id

  # Inbound connections
  dynamic "ingress"{

    for_each = var.sg_ports_ingress_windows

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.remote_public_ip_connectivity
    }
  }

  ingress {
    protocol = "icmp"
    from_port = 8
    to_port = 0
    cidr_blocks = var.remote_public_ip_connectivity
  }
  
  # Outbound connections
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # Setup tags for finding it easily
  tags = {
    "Name" = "mervin_basic_connectivity_windows"
    "CreatorName" = var.user_tag_creator
  }

}
