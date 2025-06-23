variable "release_name" {
  type = string
  description = "Helm release name"
}

variable "k8s_namespace" {
  type = string
  description = "Namespace to deploy the helm chart into"
}