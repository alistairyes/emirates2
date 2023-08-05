output "ecs_cluster_id" {
  description = "The ID of the ECS Cluster"
  value       = aws_ecs_cluster.app_cluster.id
}

output "web_service_name" {
  description = "The name of the Web Tier ECS Service"
  value       = aws_ecs_service.web_service.name
}

# Repeat similar outputs for App and Data Tiers if needed
