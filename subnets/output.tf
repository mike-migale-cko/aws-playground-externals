# Provide subnet id as output
output "subnet_olympus_id" {
  value = "The Subnet Olympus' ID is ${aws_subnet.mervin_subnet_olympus.id}"
}

output "subnet_sandbox_id" {
  value = "The Subnet Sandbox' ID is ${aws_subnet.mervin_subnet_sandbox.id}"
}