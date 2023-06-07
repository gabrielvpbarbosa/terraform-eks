##tabela de rotas

resource "aws_route_table" "cluster-eks-private-rt" {
  vpc_id = aws_vpc.cluster-eks-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.cluster-eks-nat-gateway.id
  }
  tags = {
    "Name" = format("%s-private-rt", var.cluster-name)
  }
}

resource "aws_route_table" "cluster-eks-public-rt" {
  vpc_id = aws_vpc.cluster-eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cluster-eks-gw.id
  }

  tags = {
    "Name" = format("%s-public-rt", var.cluster-name)
  }
}


resource "aws_route_table_association" "cluster-eks-rt-private-association-subnet01" {
  subnet_id      = aws_subnet.cluster-eks-private-subnet[0].id
  route_table_id = aws_route_table.cluster-eks-private-rt.id
}

resource "aws_route_table_association" "cluster-eks-rt-private-association-subnet02" {
  subnet_id      = aws_subnet.cluster-eks-private-subnet[1].id
  route_table_id = aws_route_table.cluster-eks-private-rt.id
}

resource "aws_route_table_association" "cluster-eks-rt-public-association-subnet03" {
  subnet_id      = aws_subnet.cluster-eks-public-subnet[0].id
  route_table_id = aws_route_table.cluster-eks-public-rt.id
}

resource "aws_route_table_association" "cluster-eks-rt-public-association-subnet04" {
  subnet_id      = aws_subnet.cluster-eks-public-subnet[1].id
  route_table_id = aws_route_table.cluster-eks-public-rt.id
}