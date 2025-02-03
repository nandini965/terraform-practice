variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "sub1_cidr" {
  description = "CIDR block for the  sub2"
  type        = string
  default     = "10.0.0.0/24"
}

variable "sub2_cidr" {
  description = "CIDR block for the subnet1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}