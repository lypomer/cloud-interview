provider "aws" {
  region = var.region
}

# Setup netwokring
module "eks_vpc" {
  source = "../../modules/networking/vpc"

  vpc_cidr_block = var.vpc_cidr_block
  environment    = local.environment
}

module "igw" {
  source = "../../modules/networking/igw"

  environment = local.environment
  vpc_id      = module.eks_vpc.vpc_id
}

module "subnets" {
  source = "../../modules/networking/subnets"

  vpc_id           = module.eks_vpc.vpc_id
  region           = var.region
  environment      = local.environment
  eks_cluster_name = local.eks_cluster_name
  subnets          = local.subnets
}

module "nat" {
  source = "../../modules/networking/nat"

  environment        = local.environment
  public_subnets_ids = [module.subnets.public_subnets_ids[0]] # We can deploy only one nat
  depends_on         = [module.igw]                           # Creation will fail if igw is not ready
}

module "routes" {
  source = "../../modules/networking/routes"

  vpc_id              = module.eks_vpc.vpc_id
  nat_gateway_id      = module.nat.nat_gateway_ids[0]
  public_subnets_ids  = module.subnets.public_subnets_ids
  private_subnets_ids = module.subnets.private_subnets_ids
  igw_id              = module.igw.igw_id
}

# Create EKS cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.10.1"

  name               = "${local.environment}-eks-cluster"
  kubernetes_version = var.kubernetes_version

  subnet_ids = module.subnets.private_subnets_ids
  vpc_id     = module.eks_vpc.vpc_id

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
