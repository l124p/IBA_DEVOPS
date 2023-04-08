variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "Cluster_name" {
  description = "Cluster Name"
  type = string
  default = "l124-DP"
}

variable "VPC_name" {
  description = "VPC Name"
  type = string
  default = "VPC_l124"
  
}