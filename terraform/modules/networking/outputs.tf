output "vpc_id" {
  value       = aws_vpc.eks_vpc.id
  description = "The VPC id"
}

output "private_subnets_ids" {
  value       = [for subnet in aws_subnet.private : subnet.id]
  description = "The created private subnet ids"
}
