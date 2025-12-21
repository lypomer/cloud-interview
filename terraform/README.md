<div align="center">
  <h1>Terraform AWS EKS</h1>
</div>

# Introduction
This project provides infrastructure code to setup a VPC and an EKS running on top of it.

# Prerequisites
- [terraform](https://developer.hashicorp.com/terraform) >= 1.14
- Create an SSH key pair to deploy the bastion to administrate the cluster
```bash
# You may create one using th following command, (e.g. stored in $HOME/.ssh/ec2-bastion) 
ssh-keygen -t rsa -b 4096
```

# Usage
The backend will be initialized locally by default, a better practice would be to upload the state in an s3 bucket using a lockfile system with dynamoDB or use a supported terraform backend such as [GitLab](https://docs.gitlab.com/administration/terraform_state/)

To create a new VPC and EKS cluster running on top you can do the following
```bash
# Select an environment (e.g. the dev one)
cd envs/dev

# Init the backend
terraform init

# Setting up the bastion (only on dev)
terraform plan  -var="ssh_public_key_path=${HOME}$/.ssh/ec2-bastion.pub" ---out new-eks-cluster

# Or targeting another kubernetes version (no bastion on staging and prod)
terraform plan -var="kubernetes_version=1.30" -out new-eks-cluster
```

Review changes and apply them if you are satisfied with them
```bash
# Create the cluster using the saved plan
terraform apply new-eks-cluster
```