output "private_subnets_ids" {
  value       = [for subnet in aws_subnet.private : subnet.id]
  description = "The created private subnet ids"
}

output "public_subnets_ids" {
  value       = [for subnet in aws_subnet.public : subnet.id]
  description = "The created public subnet ids"
}
