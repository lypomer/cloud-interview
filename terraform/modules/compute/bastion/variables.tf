variable "ssh_public_key_path" {
  type        = string
  description = "the SSH public key path"
}

variable "environment" {
  type        = string
  description = "the target environment label"
}

variable "vpc_id" {
  type        = string
  description = "the target VPC"
}

variable "public_subnet_id" {
  type        = string
  description = "the public subnet to access the bastion"
}

variable "maintainer_ip" {
  type        = string
  description = "the use IP to whitelist to access the bastion, defaults to all IPs"
  default     = ""
}
