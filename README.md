# Terraform-Kubernetes-AWS
Estuding Terraform

#### Basic Command

Stating and download of plugins
```` 
terraform init 
````

## Documentation and descriptions

### Provider AWS
- Provider [https://developer.hashicorp.com/terraform/intro/core-workflow]

---
### VPC for terraform

- VPC [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc]

-----
### Backend Configuration of the Terraform tfsate in a S3

Documentation: [https://developer.hashicorp.com/terraform/language/backend/s3]
#### Requeirements:
There is a bucket S3
List object

List bucket
 ````
 aws s3 ls
 ````
List object in bucket
 ````
 aws s3 ls s3://projeto-devops-bucket
 ````
----
### Command for fomatation file .tf
 
 Rewrites all Terraform configuration files to a canonical format.*
````
terraform fmt -recursive 
```` 

Check if the input is formatted. Exit status will be 0 if all input is properly formatted and non-zero otherwise.*
````
terraform fmt -recursive -check
```` 

### Pre-commit
Site office: [https://pre-commit.com/]

Installation [https://pre-commit.com/#install]

Pre-commit hook terraform [https://github.com/antonbabenko/pre-commit-terraform]

created file ```` .pre-commit-config````  and execute command ```` pre-commit install````  in bash.