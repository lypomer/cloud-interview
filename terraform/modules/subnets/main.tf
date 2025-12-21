resource "aws_subnet" "public" {
  for_each = var.subnets["public"]

  vpc_id = var.vpc_id

  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    "Name"                                          = "${var.environment}-${each.key}-${each.value.az}"
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }
}

resource "aws_subnet" "private" {
  for_each = var.subnets["private"]

  vpc_id = var.vpc_id

  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = {
    "Name"                                          = "${var.environment}-${each.key}-${each.value.az}"
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "owned"
  }
}
