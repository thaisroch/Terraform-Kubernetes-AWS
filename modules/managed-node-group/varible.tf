variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}
variable "tags" {
  type        = map(any)
  description = "Tags to be used to AWS resources"
}
variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name to be used to create mgn"
}
variable "private_subnet_1a" {
  type        = string
  description = "Subnet to create MGN AZ-1a"
}
variable "private_subnet_1b" {
  type        = string
  description = "Subnet to create MNG AZ-1b"
}