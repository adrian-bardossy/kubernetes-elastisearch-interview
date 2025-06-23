## NOTES
### Overview
- This Terraform project deploys a highly available Elasticsearch cluster on AWS EKS with secure credentials, persistent storage, TLS ingress, and automated certificate management
-  Local testing was done with Kind, and providers are commented out for that.
- File .auto.tfvars contains pre-filled variables, only 2 variables will be needed to be filled aws_access_key and aws_secret_key
- Secret_data folder contains files with password data for the kubernetes secret
- It uses a local backend so terraform state file is stored locally (for testing)
### Summary
- The solution is designed for AWS EKS using Helm and Kubernetes resources managed via Terraform.
- Folder Modules contains all created modules for the test assignment
- Full automation of deployment via Terraform commands: init, plan, apply, validate.
- Terraform-docs were used to generate module and root README files for clear documentation.
- Resources are deployed incrementally, step-by-step, into AWS and EKS cluster.
- Two providers (kubernetes and helm) are included but commented out for local testing with Kind (local Kubernetes cluster).
- The EKS node groups for Elasticsearch are configured with taints and labels to ensure pods are scheduled only on dedicated “Elasticsearch-only” nodes, demonstrating knowledge of Kubernetes node affinity and scheduling best practices.
- The ingress setup includes TLS termination and automatic certificate issuance and renewal managed by cert-manager, ensuring secure communication with minimal manual intervention.
- Local testing using Kind was leveraged to develop and validate Kubernetes manifests and Helm releases before deploying to AWS EKS, improving reliability and reducing deployment errors in the cloud environment.
### Installation instructions 
- module is written for usage using EKS cluster in AWS for that please install 
  1. Deploy the VPC module to create networking resources.
  2. Deploy the EKS module which provisions the EKS cluster on AWS.
  3. Deploy the k8s_namespace module to create the whalebone-interview namespace used by Kubernetes and Helm resources.
  4. Deploy the k8s_storage_class module for persistent storage with correct retention and default settings.
  5. Deploy the k8s_secret module which securely loads credentials from encrypted files located in the secret_data directory.
  6. Deploy the elasticsearch module with 3 replicas and pod affinity to ensure nodes run on dedicated Elasticsearch-only nodes.
  7. Deploy ingress-nginx Helm chart to expose services externally and manage ingress traffic.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.79 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.8 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.79 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_VPC"></a> [VPC](#module\_VPC) | ./modules/vpc | n/a |
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./modules/cert-manager | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_elasticsearch"></a> [elasticsearch](#module\_elasticsearch) | ./modules/elastisearch | n/a |
| <a name="module_ingress-nginx"></a> [ingress-nginx](#module\_ingress-nginx) | ./modules/ingress-nginx | n/a |
| <a name="module_k8s_ns"></a> [k8s\_ns](#module\_k8s\_ns) | ./modules/k8s_namespace | n/a |
| <a name="module_k8s_secret"></a> [k8s\_secret](#module\_k8s\_secret) | ./modules/k8s_secret | n/a |
| <a name="module_k8s_storage_class"></a> [k8s\_storage\_class](#module\_k8s\_storage\_class) | ./modules/k8s_storage_class | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster_auth.token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_access_key"></a> [aws\_access\_key](#input\_aws\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | n/a | yes |
| <a name="input_aws_secret_key"></a> [aws\_secret\_key](#input\_aws\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Namespace of kubernetes deployment | `string` | n/a | yes |
| <a name="input_k8s_storage_class_name"></a> [k8s\_storage\_class\_name](#input\_k8s\_storage\_class\_name) | Storage class name for the deloyment to k8s cluster | `string` | n/a | yes |
| <a name="input_password_file"></a> [password\_file](#input\_password\_file) | n/a | `string` | n/a | yes |
| <a name="input_username_file"></a> [username\_file](#input\_username\_file) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
