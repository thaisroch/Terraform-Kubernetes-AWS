# Documentation terraform this resouce - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
# EIP
resource "aws_eip" "eks_ngw_eip_1a" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1a"
    }
  )
}

resource "aws_eip" "eks_ngw_eip_1b" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip-1b"
    }
  )
}

# Documentation this resource https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
# The resource ngw is creating in a subnet public, but who used the resources subnet private.
# NAT GATEWAY A
resource "aws_nat_gateway" "eks-ngw-subnet-private-1a" {
  allocation_id = aws_eip.eks_ngw_eip_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-subnet-private-1a"
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_igw]
}

# Documentation this resource https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway
# The resource ngw is creating in a subnet public, but who used the resources of subnet private.
# NAT GATEWAY A
resource "aws_nat_gateway" "eks-ngw-subnet-private-1b" {
  allocation_id = aws_eip.eks_ngw_eip_1b.id
  subnet_id     = aws_subnet.eks_subnet_public_1b.id

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-ngw-subnet-private-1b"
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks_igw]
}


# Documentation terraform this resource https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table
# ROUTE TABLE PRIVATE A
resource "aws_route_table" "eks_route_table_private-1a" {
  vpc_id = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-subnet-private-1a.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-priv-route-table-1a"
    }
  )
}

# Documentation terraform this resource https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table
# ROUTE TABLE PRIVATE B
resource "aws_route_table" "eks_route_table_private-1b" {
  vpc_id = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-ngw-subnet-private-1b.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-priv-route-table-1b"
    }
  )
}