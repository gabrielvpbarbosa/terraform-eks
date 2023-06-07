data "tls_certificate" "tls_cert" {
  url = aws_eks_cluster.cluster-eks.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "iam_openid_connect_provider" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = data.tls_certificate.tls_cert.certificates[*].sha1_fingerprint
  url             = data.tls_certificate.tls_cert.url
}

output "cluster_oidc_issuer_url" {
  value = data.tls_certificate.tls_cert.url
}
output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.iam_openid_connect_provider.arn
}

output "cluster_oidc_issuer_id" {
  value = aws_iam_openid_connect_provider.iam_openid_connect_provider.url
}