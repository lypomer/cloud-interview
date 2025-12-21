variable "vpc_id" {
  type        = string
  description = "the target VPC id"
}

variable "region" {
  type        = string
  description = "the target aws region"
}

variable "vpc_cidr_block" {
  type        = string
  description = "the base network CIDR block for our VPC"
}

variable "environment" {
  type        = string
  description = "the target environment label"
}

variable "eks_cluster_name" {
  type = string
}
