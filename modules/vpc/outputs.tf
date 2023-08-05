output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.app_vpc.id
}

output "web_subnet_id" {
  description = "The ID of the Web Subnet"
  value       = aws_subnet.web_subnet.id
}

output "app_subnet_id" {
  description = "The ID of the App Subnet"
  value       = aws_subnet.app_subnet.id
}

output "data_subnet_id" {
  description = "The ID of the Data Subnet"
  value       = aws_subnet.data_subnet.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}
