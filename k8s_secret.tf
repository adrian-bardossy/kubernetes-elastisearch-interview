module "k8s_secret" {
    #  provider block to use kind as cluster
    # providers = {
    #   kubernetes = kubernetes.whalebone-cluster
    # }
    source = "./modules/k8s_secret"
    secret_name = local.secret_name
    k8s_namespace = module.k8s_ns.interview_k8s_ns
    username_file = var.username_file
    password_file = var.password_file
}