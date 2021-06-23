# Provide Security Groups id as output
output "sg_win_basic_id" {
  value = "The SG ID for mervin_basic_connectivity_windows is ${aws_security_group.mervin_basic_connectivity_windows.id}"
}

output "sg_linux_basic_id" {
  value = "The SG ID for mervin_basic_connectivity_linux is ${aws_security_group.mervin_basic_connectivity_linux.id}"
}