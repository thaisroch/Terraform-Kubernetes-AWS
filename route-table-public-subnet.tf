# Documentation terraform this resource https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table
resource "aws_route_table" "eks_route_table_public" {
  vpc_id = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-public-route-table"
    }
  )
}

