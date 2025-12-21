variable "vpc_cidr_block" {
  type        = string
  description = "the base network CIDR block for our VPC"
}

variable "environment" {
  type        = string
  description = "the target environment label"
}
