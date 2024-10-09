module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}
module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.eks_subnet_pub_1a
  public_subnet_1b = module.eks_network.eks_subnet_pub_1b
}
module "eks_mng" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  tags              = local.tags
  eks_cluster_name  = module.eks_cluster.eks_cluster_name
  private_subnet_1a = module.eks_network.eks_subnet_priv_1a
  private_subnet_1b = module.eks_network.eks_subnet_priv_1b
}
module "eks_aws_load_balancer_controller" {
  source           = "./modules/aws-load-balancer-controller"
  project_name     = var.project_name
  tags             = local.tags
  oidc             = module.eks_cluster.oidc
  eks_cluster_name = module.eks_cluster.eks_cluster_name
  eks_vpc_id       = module.eks_network.eks_vpc_id
}