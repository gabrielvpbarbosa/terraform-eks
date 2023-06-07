resource "aws_subnet" "cluster-eks-private-subnet" {
  count = 2

  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  # cidr_block        = cidrsubnet(aws_vpc.cluster-eks-vpc.cidr_block, 16, count.index)
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index + 1)
  vpc_id     = aws_vpc.cluster-eks-vpc.id

  tags = {
    "Name"                                      = format("%s-private-subnet-${count.index + 1}", var.cluster-name)
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
  }
}