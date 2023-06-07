module "network" {
  source                    = "./module/network"
  cluster-name              = var.cluster-name
  vpc_cidr_block            = var.vpc_cidr_block
  cluster_security_group_id = module.cluster.cluster_security_group_id
}

module "cluster" {
  source                     = "./module/cluster"
  cluster-name               = var.cluster-name
  cluster_version            = var.cluster_version
  cluster-eks-private-subnet = module.network.cluster-eks-private-subnet
  aws_region                 = module.network.aws_region
}

module "nodes" {
  source                     = "./module/nodes"
  cluster-name               = module.cluster.cluster_eks
  cluster_version            = var.cluster_version
  disk_size                  = var.disk_size
  instance_type              = var.instance_type
  instance_desired_size      = var.instance_desired_size
  instance_max_size          = var.instance_max_size
  instance_min_size          = var.instance_min_size
  cluster-eks-private-subnet = module.network.cluster-eks-private-subnet
}

module "helm-charts" {
  source = "./module/helm-charts"
  depends_on = [
    module.nodes
  ]
}

module "cluster_autoscaler" {
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-cluster-autoscaler.git"

  enabled = true

  cluster_name = module.cluster.cluster_eks
  # cluster_identity_oidc_issuer     = module.cluster.cluster_oidc_issuer_url
  cluster_identity_oidc_issuer     = module.cluster.cluster_oidc_issuer_id
  cluster_identity_oidc_issuer_arn = module.cluster.oidc_provider_arn
  aws_region                       = module.network.aws_region
}

