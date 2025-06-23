module "elasticsearch" {
  # provider block to use kind as cluster
  # providers = {
  #   helm = helm.whalebone-helm-cluster
  #   kubernetes = kubernetes.whalebone-cluster
  # }
  source = "./modules/elastisearch"
  release_name = local.elasticsearch_release_name
  k8s_namespace = module.k8s_ns.interview_k8s_ns
}