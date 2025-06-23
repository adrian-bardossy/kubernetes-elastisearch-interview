resource "kubernetes_storage_class_v1" "whalebone_storage_class" {
  metadata {
    name = var.k8s_storage_class_name
    annotations = {
        "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
  # used for local testing using kind
  # storage_provisioner = "k8s.io/minikube-hostpath"
  # used for eks cluster
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy = "Retain"
  volume_binding_mode = "Immediate"
}
