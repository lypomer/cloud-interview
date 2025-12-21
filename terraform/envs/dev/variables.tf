# VPC config
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

# Bastion config
variable "maintainer_ip" {
  type        = string
  description = "the use IP to whitelist to access the bastion, defaults to all IPs"
  default     = ""
}

variable "ssh_public_key_path" {
  type        = string
  description = "the SSH public key path"
}

# Kubernetes config
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
  default     = ["t3.small"]
  description = "The instance types used by the node pool"
}


