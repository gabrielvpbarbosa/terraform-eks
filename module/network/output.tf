output "vpc-eks" {
  value = aws_vpc.cluster-eks-vpc.id
}

output "cluster-eks-private-subnet" {
  value = aws_subnet.cluster-eks-private-subnet[*].id
}


output "aws_region" {
  value = data.aws_region.current.name
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}