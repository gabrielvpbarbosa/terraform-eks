resource "aws_subnet" "cluster-eks-public-subnet" {
  count = 2

  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, (count.index + 3))
  vpc_id            = aws_vpc.cluster-eks-vpc.id

  tags = {
    "Name"                                      = format("%s-public-subnet-${count.index + 3}", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
  }
}

