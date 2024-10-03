resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id            = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-subnet-private-1a",
      # tag private subnets EKS - https://docs.aws.amazon.com/eks/latest/userguide/network-reqs.html
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-subnet-private-1b",
      # tag private subnets EKS - https://docs.aws.amazon.com/eks/latest/userguide/network-reqs.html
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

# Documentation terraform this resource https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
# ROUTE TABLE ASSOCIATION A
resource "aws_route_table_association" "eks_rtb_assoc_private_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.eks_route_table_private-1a.id
}
# ROUTE TABLE ASSOCIATION B
resource "aws_route_table_association" "eks_rtb_assoc_private_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.eks_route_table_private-1b.id
}