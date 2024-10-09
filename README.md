
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.67.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 1.15.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 1.32.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_aws_load_balancer_controller"></a> [eks\_aws\_load\_balancer\_controller](#module\_eks\_aws\_load\_balancer\_controller) | ./modules/aws-load-balancer-controller | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./modules/cluster | n/a |
| <a name="module_eks_mng"></a> [eks\_mng](#module\_eks\_mng) | ./modules/managed-node-group | n/a |
| <a name="module_eks_network"></a> [eks\_network](#module\_eks\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Networking CIDR block to be used for the VPC | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name to be used to name the resources (Name tag) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_vpc_id"></a> [eks\_vpc\_id](#output\_eks\_vpc\_id) | output "eks\_subnet\_private\_0a" { value = module.eks\_network.eks\_subnet\_priv\_1a } output "eks\_subnet\_private\_1b" { value = module.eks\_network.eks\_subnet\_priv\_1b } output "eks\_subnet\_public\_1a" { value = module.eks\_network.eks\_subnet\_pub\_1a } output "eks\_subnet\_public\_1b" { value = module.eks\_network.eks\_subnet\_pub\_1b } output "eks\_cluster\_vpc\_config" { value = module.eks\_cluster.eks\_vpc\_config } output "oidc" { value = module.eks\_cluster.oidc }  output "eks\_cluste\_certificate\_authority" { value = module.eks\_cluster.eks\_cluste\_certificate\_authority } output "endpoint" { value = module.eks\_cluster.eks\_cluster\_endpoint } |
<!-- END_TF_DOCS -->