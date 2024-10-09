variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}
variable "tags" {
  type        = map(any)
  description = "Tags to be used to AWS resources"
}
variable "oidc" {
  type        = string
  description = "HTTPS URL from OIDC provider of the EKS cluster"
}
variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name to be used to create helm load-balancer-controller"
}
variable "eks_vpc_id" {
  type        = string
  description = "VPC id to be used to create helm load-balancer-controller"
}