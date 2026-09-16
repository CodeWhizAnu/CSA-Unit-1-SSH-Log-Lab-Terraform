output "instance_id" {
  value = aws_instance.ssh_log_lab.id
}

output "public_ip" {
  description = "Public IP - use this to SSH in and later grep the logs. Do not share this publicly."
  value       = aws_instance.ssh_log_lab.public_ip
}

output "public_dns" {
  value = aws_instance.ssh_log_lab.public_dns
}

output "security_group_id" {
  value = aws_security_group.ssh_log_lab.id
}
