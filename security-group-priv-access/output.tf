# Provide Security Groups id as output
output "sg_priv_win_id" {
  value = "The SG ID for mervin_priv_windows is ${aws_security_group.mervin_priv_windows.id}"
}

output "sg_priv_linux_id" {
  value = "The SG ID for mervin_priv_linux is ${aws_security_group.mervin_priv_linux.id}"
}