module "k8s_ns" {
    #provider block to use kind as cluster
    # providers = {
    #   kubernetes = kubernetes.whalebone-cluster
    # }
    source = "./modules/k8s_namespace"
    k8s_namespace = var.k8s_namespace
}