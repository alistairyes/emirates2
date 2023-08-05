output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpn_connection_id" {
  description = "VPN Connection ID"
  value       = aws_vpn_connection.vpn_connection.id
}

# Additional outputs as needed
