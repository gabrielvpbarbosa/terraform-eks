resource "aws_nat_gateway" "cluster-eks-nat-gateway" {
  allocation_id = aws_eip.cluster-eks-elastic-ip.id
  subnet_id     = aws_subnet.cluster-eks-public-subnet[0].id

  tags = {
    "Name" = format("%s-nat-gateway", var.cluster-name)
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.cluster-eks-gw]
}
