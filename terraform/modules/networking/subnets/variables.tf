variable "vpc_id" {
  type        = string
  description = "the target VPC id"
}

variable "region" {
  type        = string
  description = "the target aws region"
}

variable "environment" {
  type        = string
  description = "the target environment label"
}

variable "eks_cluster_name" {
  type = string
}

variable "subnets" {
  type = object({
    public = map(object({
      az         = string
      cidr_block = string
    }))
    private = map(object({
      az         = string
      cidr_block = string
    }))
  })
  description = "The public and private subnets configuration"
}
