resource "helm_release" "elasticsearch" {
  name       = var.release_name
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
  version    = "8.5.1"

  namespace  = var.k8s_namespace
  create_namespace = false

  values = [
    file("${path.module}/elastisearch-values.yaml")
  ]
  depends_on = [
    kubernetes_manifest.letsencrypt_staging_clusterissuer
  ]
}
