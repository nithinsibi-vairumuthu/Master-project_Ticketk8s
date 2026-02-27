module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "eks" {
  source = "./modules/eks"

  cluster_name = var.cluster_name
  subnet_ids   = module.vpc.private_subnet_ids
}

module "nodegroup" {
  source = "./modules/nodegroup"

  cluster_name       = module.eks.cluster_name
  private_subnet_ids = module.vpc.private_subnet_ids

  instance_type = "t3.medium"

  desired_size = 2
  min_size     = 2
  max_size     = 5
}


module "iam" {
  source = "./modules/iam"

  cluster_name       = module.eks.cluster_name
  oidc_provider_arn  = module.eks.oidc_provider_arn
  oidc_provider_url  = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}