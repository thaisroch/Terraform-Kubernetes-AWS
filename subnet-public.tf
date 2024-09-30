resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id # dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1)
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name = "projeto-devops-subnet-public-1a",
      # tag Public subnets - https://docs.aws.amazon.com/eks/latest/userguide/network-reqs.html
      "kubernetes.io/role/elb" = 1
    }

  )
}

resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id # dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = merge(
    local.tags,
    {
      Name = "projeto-devops-subnet-public-1b",
      # tag Public subnets - https://docs.aws.amazon.com/eks/latest/userguide/network-reqs.html
      "kubernetes.io/role/elb" = 1
    }

  )
}