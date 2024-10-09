
output "eks_vpc_config" {
  value = aws_eks_cluster.eks_cluster.vpc_config
}

output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluste_certificate_authority" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
