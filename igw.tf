# Documentation terrform for this resource - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
# INTERNET GATEWAY
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-igw"
    }
  )
}

# Documentation terraform this resource https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table
# ROUTE TABLE PUBLIC 
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
