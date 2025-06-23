variable "secret_name" {
  type = string
  description = "Secret name to deploy to k8s cluster"
}

variable "k8s_namespace" {
  type = string
  description = "Namespace to deploy the secret into"
}

variable "username_file" {
    type = string
    description = "Path to username file secret data"
    sensitive = true
}

variable "password_file" {
  type = string
  description = "Path to password file secret data"
  sensitive = true
}

