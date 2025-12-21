<div align="center">
  <h1>Terraform AWS EKS</h1>
</div>

# Introduction
This project provides infrastructure code to setup a VPC and an EKS running on top of it.

# Prerequisites
- [terraform](https://developer.hashicorp.com/terraform) >= 1.14

# Usage
The backend will be initialized locally by default, a better practice would be to upload the state in an s3 bucket using a lockfile system with dynamoDB or use a supported terraform backend such as [GitLab](https://docs.gitlab.com/administration/terraform_state/)

To create a new VPC and EKS cluster running on top you can do the following
```bash
# Select an environment (e.g. the dev one)
cd envs/dev

# Init the backend
terraform init

# Using default values
terraform plan -out new-eks-cluster

# Or targeting another kubernetes version
terraform plan -var="kubernetes_version=1.30" -out new-eks-cluster
```

Review changes and apply them if you are satisfied with them
```bash
# Create the cluster using the saved plan
terraform apply new-eks-cluster
```