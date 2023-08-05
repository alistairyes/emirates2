variable "web_subnet_ids" {
  description = "List of subnet IDs for the Web Tier"
  type        = list(string)
}

variable "web_security_group_id" {
  description = "Security Group ID for the Web Tier"
  type        = string
}

variable "app_subnet_ids" {
  description = "List of subnet IDs for the App Tier"
  type        = list(string)
}

variable "app_security_group_id" {
  description = "Security Group ID for the App Tier"
  type        = string
}

variable "data_subnet_ids" {
  description = "List of subnet IDs for the Data Tier"
  type        = list(string)
}

variable "data_security_group_id" {
  description = "Security Group ID for the Data Tier"
  type        = string
}
