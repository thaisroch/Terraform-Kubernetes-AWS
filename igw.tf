# Documentation terrform for this resource - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )
}