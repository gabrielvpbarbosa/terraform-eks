resource "aws_iam_role" "cluster-eks-node-group-role" {
  # name = format("%s-node-group-role", var.cluster-name)
  name = format("%s-node-group-role", var.cluster-name)
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "cluster-eks-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.cluster-eks-node-group-role.name
}

resource "aws_iam_role_policy_attachment" "cluster-eks-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.cluster-eks-node-group-role.name
}

resource "aws_iam_role_policy_attachment" "cluster-eks-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.cluster-eks-node-group-role.name
}
