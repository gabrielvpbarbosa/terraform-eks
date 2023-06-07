resource "aws_eks_node_group" "cluster-eks-node-group" {
  cluster_name    = var.cluster-name
  node_group_name = format("%s-node-group", var.cluster-name)
  node_role_arn   = aws_iam_role.cluster-eks-node-group-role.arn
  subnet_ids      = [var.cluster-eks-private-subnet[0], var.cluster-eks-private-subnet[1]]
  instance_types  = [var.instance_type]
  version         = var.cluster_version
  disk_size       = var.disk_size
  scaling_config {
    desired_size = var.instance_desired_size
    max_size     = var.instance_max_size
    min_size     = var.instance_min_size
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    "k8s.io/cluster-autoscaler/${var.cluster-name}" = "owned"
    "k8s.io/cluster-autoscaler/enabled"             = "TRUE"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.cluster-eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.cluster-eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.cluster-eks-AmazonEC2ContainerRegistryReadOnly

  ]
}
