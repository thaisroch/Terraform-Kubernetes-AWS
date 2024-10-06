# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group
resource "aws_eks_node_group" "eks_mgn" {
  cluster_name    = var.eks_cluster_name
  node_group_name = "${var.project_name}-mgn"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  instance_types  = ["t2.micro"]
  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attach_ecr,
    aws_iam_role_policy_attachment.eks_mng_role_attach_worker,
    aws_iam_role_policy_attachment.eks_mng_role_attach_cni
  ]
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-mgn"
    }
  )
}