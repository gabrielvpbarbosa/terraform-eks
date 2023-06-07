terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = ">= 4.10.0"
    }
    helm = {
      source = "hashicorp/helm"
      # version = "2.10.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      # version = "2.21.1"
    }
  }
  backend "s3" {
    bucket = "your-bucket-name"
    key    = "terraform.tfstate"
    region = "your-region"
  }
}

provider "aws" {
  # Configuration options
  region     = var.region_provider
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "helm" {
  kubernetes {
    host                   = module.cluster.endpoint
    cluster_ca_certificate = base64decode(module.cluster.kubeconfig-certificate-authority-data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster-name]
      command     = "aws"
    }
  }
}



