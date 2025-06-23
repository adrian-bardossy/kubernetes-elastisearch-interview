terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.79"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.8"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_ca_data)
  token                  = data.aws_eks_cluster_auth.token.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_ca_data)
    token                  = data.aws_eks_cluster_auth.token.token
  }
}

data "aws_eks_cluster_auth" "token" {
  name = module.eks.cluster_name
}


# kubernetes and helm providers used for local testing using kind
# provider "kubernetes" {
#   alias = "whalebone-cluster"
#   config_path    = "~/.kube/config"
#   config_context = "kind-whalebone-es-test"
# }

# provider "helm" {
#   alias = "whalebone-helm-cluster"

#   kubernetes {
#     config_path    = "~/.kube/config"
#     config_context = "kind-whalebone-es-test"
#   }
# }
