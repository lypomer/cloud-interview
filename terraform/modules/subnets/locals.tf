locals {
  availability_zones = { "a" = "${var.region}a", "b" = "${var.region}b", "c" = "${var.region}c" }
  subnets = {
    "public" : {
      "public-1" = {
        "az"         = local.availability_zones["a"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 1)
      },
      "public-2" = {
        "az"         = local.availability_zones["b"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 2)
      },
      "public-3" = {
        "az"         = local.availability_zones["c"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 3)
      },
    },
    "private" : {
      "private-1" = {
        "az"         = local.availability_zones["a"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 4)
      },
      "private-2" = {
        "az"         = local.availability_zones["b"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 5)
      },
      "private-3" = {
        "az"         = local.availability_zones["c"],
        "cidr_block" = cidrsubnet(var.vpc_cidr_block, 8, 6)
      },
    }
  }
}
