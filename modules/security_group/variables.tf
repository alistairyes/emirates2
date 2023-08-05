variable "vpc_id" {
  description = "The ID of the VPC where the security groups will be created"
  type        = string
}

variable "app_port" {
  description = "The port number for the App Tier"
  type        = number
  default     = 8080
}

variable "data_port" {
  description = "The port number for the Data Tier"
  type        = number
  default     = 5432
}
