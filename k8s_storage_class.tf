module "k8s_storage_class" {
    # provider block to use kind as cluster
    # providers = {
    #   kubernetes = kubernetes.whalebone-cluster
    # }
    source = "./modules/k8s_storage_class"
    k8s_storage_class_name = var.k8s_storage_class_name
    
}
