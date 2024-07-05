// Fetch all availability zones within your selected region
data "aws_availability_zones" "zones" {}

// Create 3 subnets
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.zones.names[0]

  tags = {
    Name = "${var.project_name}-subnet1"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.zones.names[1]

  tags = {
    Name = "${var.project_name}-subnet2"
  }
}
resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet3_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.zones.names[2]

  tags = {
    Name = "${var.project_name}-subnet3"
  }
}
