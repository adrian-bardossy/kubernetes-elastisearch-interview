resource "kubernetes_secret" "elasticsearch_credentials" {
  metadata {
    name      = var.secret_name
    namespace = var.k8s_namespace
  }

  data = {
    username = local.username
    password = local.password
  }

  type = "Opaque"
}

