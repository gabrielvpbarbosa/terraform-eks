resource "aws_eip" "cluster-eks-elastic-ip" {
  vpc = true
}
