# Dev EKS cluster

This implementation provides a dev EKS cluster

# Variables
| Key                | Type         | Default      | Description                                     |
|--------------------|--------------|--------------|-------------------------------------------------|
| region             | string       | eu-west-1    | The target AWS region to deploy the EKS cluster |
| vpc_cidr_block     | string       | 10.0.0.0/16  | The base CIDR block to setup the VPC network    |
| kubernetes_version | string       | 1.34         | The kubernetes version to install in EKS        |
| node_pool_max_size | number       | 3            | The maximum amount of node in node pool         |
| node_pool_types    | list(string) | ["t3.small"] | "The instance types used by the node pool"      |

# Outputs
| Key          | Description              |
|--------------|--------------------------|
| vpc_id       | The created VPC id       |
| eks_endpoint | The EKS cluster endpoint |
| eks_id       | The EKS cluster id       |
| bastion_ip   | The bastion IP           |