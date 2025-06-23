resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "5.7.0"

  namespace        = "ingress-nginx"
  create_namespace = true

  values = [
    file("${path.module}/ingress-nginx-values.yaml")
  ]
}
