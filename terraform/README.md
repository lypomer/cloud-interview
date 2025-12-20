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
# Using default values
terraform plan -out new-eks-cluster

# Or targeting another environment
terraform plan -var="environment=prod" -out new-eks-cluster
```

Review changes and apply them if you are satisfied with them
```bash
# Create the cluster using the saved plan
terraform apply new-eks-cluster
```

# Variables
| Key                | Type         | Default      | Description                                     |
|--------------------|--------------|--------------|-------------------------------------------------|
| region             | string       | eu-west-1    | The target AWS region to deploy the EKS cluster |
| vpc_cidr_block     | string       | 10.0.0.0/16  | The base CIDR block to setup the VPC network    |
| environment        | string       | dev          | Target environment used for labelling           |
| kubernetes_version | string       | 1.34         | The kubernetes version to install in EKS        |
| node_pool_max_size | number       | 3            | The maximum amount of node in node pool         |
| node_pool_types    | list(string) | ["t3.small"] | "The instance types used by the node pool"      |

# Outputs
| Key          | Description              |
|--------------|--------------------------|
| vpc_id       | The created VPC id       |
| eks_endpoint | The EKS cluster endpoint |
| eks_id       | The EKS cluster id       |