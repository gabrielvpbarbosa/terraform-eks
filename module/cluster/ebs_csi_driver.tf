resource "aws_iam_role" "amazoneks_ebs_csi_driver" {
  name = format("%s-amazoneks_ebs_csi_driver", var.cluster-name)

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${aws_iam_openid_connect_provider.iam_openid_connect_provider.arn}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${aws_iam_openid_connect_provider.iam_openid_connect_provider.url}:aud": "sts.amazonaws.com",
          "${aws_iam_openid_connect_provider.iam_openid_connect_provider.url}:sub": "system:serviceaccount:kube-system:ebs-csi-controller-sa"
        }
      }
    }
  ]
}
POLICY
}
resource "aws_iam_role_policy_attachment" "cluster-eks-AmazonEKS_EBS_CSI_Driver" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.amazoneks_ebs_csi_driver.name
}

resource "aws_eks_addon" "aws-ebs-csi-driver" {
  cluster_name = aws_eks_cluster.cluster-eks.name
  addon_name   = "aws-ebs-csi-driver"
  #   resolve_conflicts           = "OVERWRITE"
  service_account_role_arn = aws_iam_role.amazoneks_ebs_csi_driver.arn
  depends_on = [
    aws_iam_role_policy_attachment.cluster-eks-AmazonEKS_EBS_CSI_Driver,
    aws_eks_cluster.cluster-eks
  ]
}