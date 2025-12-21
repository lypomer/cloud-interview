variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "The target AWS region to deploy the EKS cluster"
}

variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The base CIDR block to setup the VPC network"
}

variable "kubernetes_version" {
  type        = string
  default     = "1.34"
  description = "The kubernetes version to install in EKS"
}

variable "node_pool_max_size" {
  type        = number
  default     = 3
  description = "The maximum amount of node in node pool"
}

variable "node_pool_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "The instance types used by the node pool"
}
