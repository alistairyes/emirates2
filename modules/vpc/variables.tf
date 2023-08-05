variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "web_subnet_cidr" {
  description = "CIDR block for the Web Subnet"
  type        = string
}

variable "app_subnet_cidr" {
  description = "CIDR block for the App Subnet"
  type        = string
}

variable "data_subnet_cidr" {
  description = "CIDR block for the Data Subnet"
  type        = string
}

variable "availability_zone_a" {
  description = "Availability Zone A for the region"
  type        = string
}

variable "availability_zone_b" {
  description = "Availability Zone B for the region"
  type        = string
}
