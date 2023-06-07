resource "aws_eks_cluster" "cluster-eks" {
  name     = var.cluster-name
  role_arn = aws_iam_role.eks-cluster-role.arn
  version  = var.cluster_version
  vpc_config {
    subnet_ids = [var.cluster-eks-private-subnet[0], var.cluster-eks-private-subnet[1]]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.cluster-eks-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster-eks-AmazonEKSVPCResourceController
  ]
}