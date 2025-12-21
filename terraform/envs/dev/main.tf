provider "aws" {
  region = var.region
}

# Setup netwokring
module "networking" {
  source = "../../modules/networking"

  region           = var.region
  vpc_cidr_block   = var.vpc_cidr_block
  environment      = local.environment
  eks_cluster_name = local.eks_cluster_name
}

# Create EKS cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.10.1"

  name               = "${local.environment}-eks-cluster"
  kubernetes_version = var.kubernetes_version

  subnet_ids = module.networking.private_subnets_ids
  vpc_id     = module.networking.vpc_id

  tags = {
    environment = local.environment
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = var.node_pool_max_size
      desired_size = ceil(var.node_pool_max_size / 2)

      instance_types = var.node_pool_types
    }
  }
}
