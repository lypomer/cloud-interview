variable "vpc_id" {
  type        = string
  description = "the target VPC id"
}

variable "igw_id" {
  description = "an  internet gateway id"
  type        = string
}

variable "nat_gateway_id" {
  description = "a NAT gateway id"
  type        = string
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "the public subnets ids"
}

variable "private_subnets_ids" {
  type        = list(string)
  description = "the private subnets ids"
}
