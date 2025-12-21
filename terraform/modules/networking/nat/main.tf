# Nat
resource "aws_eip" "nat" {
  domain = "vpc"
  tags = {
    Name = "${var.environment}-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  count         = length(var.public_subnets_ids)
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnets_ids[count.index]

  tags = {
    Name = "${var.environment}-nat"
  }
}
