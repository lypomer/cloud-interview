locals {
  environment      = "dev"
  eks_cluster_name = "${local.environment}-cluster"


  availability_zones = { "a" = "${var.region}a", "b" = "${var.region}b" }
  subnets = {
    "public" : {
      "public-1" = {
        "az"         = local.availability_zones["a"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 1)
      },
      "public-2" = {
        "az"         = local.availability_zones["b"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 2)
      }
    },
    "private" : {
      "private-1" = {
        "az"         = local.availability_zones["a"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 3)
      },
      "private-2" = {
        "az"         = local.availability_zones["b"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 4)
      }
    }
  }
}
