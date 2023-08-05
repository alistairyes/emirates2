output "web_security_group_id" {
  description = "The ID of the Web Tier Security Group"
  value       = aws_security_group.web_sg.id
}

output "app_security_group_id" {
  description = "The ID of the App Tier Security Group"
  value       = aws_security_group.app_sg.id
}

output "data_security_group_id" {
  description = "The ID of the Data Tier Security Group"
  value       = aws_security_group.data_sg.id
}
