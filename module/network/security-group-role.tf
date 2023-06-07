resource "aws_security_group_rule" "eks_sg_ingress_rule" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"

  security_group_id = var.cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "eks_sg_ingress_rule_http" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"

  security_group_id = var.cluster_security_group_id
  type              = "ingress"
}