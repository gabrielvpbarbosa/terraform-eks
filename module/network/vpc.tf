resource "aws_vpc" "cluster-eks-vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true


  tags = {
    "Name" = format("%s-vpc", var.cluster-name)
  }
}