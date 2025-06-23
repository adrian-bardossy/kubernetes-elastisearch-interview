variable "aws_region" {
  type = string
}

variable "aws_access_key" {
  type      = string
  sensitive = true
}

variable "aws_secret_key" {
  type      = string
  sensitive = true
}

variable "k8s_namespace" {
  type = string
  description = "Namespace of kubernetes deployment"
}

variable "k8s_storage_class_name" {
  type = string
  description = "Storage class name for the deloyment to k8s cluster"
}

variable "username_file" {
  type = string
}

variable "password_file" {
  type = string
}

