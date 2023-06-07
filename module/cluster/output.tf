output "cluster_eks" {
  value = aws_eks_cluster.cluster-eks.id
}

output "cluster_eks_name" {
  value = aws_eks_cluster.cluster-eks.name
}

output "endpoint" {
  value = aws_eks_cluster.cluster-eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.cluster-eks.certificate_authority[0].data
}
output "cluster_security_group_id" {
  value = aws_eks_cluster.cluster-eks.vpc_config[0].cluster_security_group_id
}
output "eks_vpc_cidr" {
  value = aws_eks_cluster.cluster-eks.vpc_config
}