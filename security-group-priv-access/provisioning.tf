
# Get the default VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Create a Security Group Linux Private Servers
resource "aws_security_group" "mervin_priv_linux" {
  
  name = "mervin_priv_linux"
  vpc_id = aws_default_vpc.default.id

  # Inbound connections
  dynamic "ingress"{

    for_each = var.sg_ports_ingress_linux

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.ip_subnet_priv_block]
    }
  }

  ingress {
    protocol = "icmp"
    from_port = 8
    to_port = 0
    cidr_blocks = [var.ip_subnet_priv_block]
  }
  
  # Outbound connections
  egress = []
  
  # Setup tags for finding it easily
  tags = {
    "Name" = "mervin_priv_linux"
    "CreatorName" = var.user_tag_creator
  }
}

# Create a Security Group for Windows
resource "aws_security_group" "mervin_priv_windows" {
  
  name = "mervin_priv_windows"
  vpc_id = aws_default_vpc.default.id

  # Inbound connections

  # TCP Connections
  dynamic "ingress"{

    for_each = var.sg_ports_ingress_windows_tcp

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.ip_subnet_priv_block]
    }
  }

  # UDP Connections
  dynamic "ingress"{

    for_each = var.sg_ports_ingress_windows_udp

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "udp"
      cidr_blocks = [var.ip_subnet_priv_block]
    }
  }
  

  # Outbound connections

  # TCP Connections
  dynamic "egress"{

    for_each = var.sg_ports_ingress_windows_tcp

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = [var.ip_subnet_priv_block]
    }
  }

  # UDP Connections
  dynamic "egress"{

    for_each = var.sg_ports_ingress_windows_udp

    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "udp"
      cidr_blocks = [var.ip_subnet_priv_block]
    }
  }
  
  # Setup tags for finding it easily
  tags = {
    "Name" = "mervin_priv_windows"
    "CreatorName" = var.user_tag_creator
  }

}
