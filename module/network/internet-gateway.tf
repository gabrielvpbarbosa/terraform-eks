resource "aws_internet_gateway" "cluster-eks-gw" {
  vpc_id = aws_vpc.cluster-eks-vpc.id

  tags = {
    "Name" = format("%s-gw", var.cluster-name)
  }
}