resource "aws_subnet" "eks_subnet_privite_1a" {
  vpc_id            = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.name}a"

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-subnet-privite-1a",
      # tag privite subnets EKS - https://docs.aws.amazon.com/eks/latest/userguide/network-reqs.html
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "eks_subnet_privite_1b" {
  vpc_id            = aws_vpc.eks_vpc.id # Dependence for id of vpc https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc#attribute-reference
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.name}b"

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-subnet-privite-1b",
      # tag privite subnets EKS - https://docs.aws.amazon.com/eks/latest/userguide/network-reqs.html
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}