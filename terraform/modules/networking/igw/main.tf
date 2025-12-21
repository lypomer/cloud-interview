# Out to the internet
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.environment}-igw"
  }
}
