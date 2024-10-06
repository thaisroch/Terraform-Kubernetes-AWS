# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster#vpc_config

resource "aws_security_group_rule" "eks_cluster_sg_role" {
  type      = "ingress"
  from_port = 443
  to_port   = 443
  protocol  = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  description       = "Acess to all trafic"
  security_group_id = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id

}