variable "environment" {
  type        = string
  description = "the target environment label"
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "the public subnets ids to attach a nat gateway"
}
