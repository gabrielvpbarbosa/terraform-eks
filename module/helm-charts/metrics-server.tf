resource "helm_release" "metrics-server" {
  name             = "metrics-server"
  namespace        = "metrics-server"
  create_namespace = "true"
  repository       = "https://kubernetes-sigs.github.io/metrics-server/"
  chart            = "metrics-server"
}