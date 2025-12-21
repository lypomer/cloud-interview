output "vpc_id" {
  value       = module.eks_vpc.vpc_id
  description = "The created VPC id"
}

# output "eks_endpoint" {
#   value       = module.eks.cluster_endpoint
#   description = "The EKS cluster endpoint"
# }

# output "eks_id" {
#   value       = module.eks.cluster_id
#   description = "The EKS cluster id"
# }
