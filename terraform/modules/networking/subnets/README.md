# Subnets module
Creates Subnets

# Variables
| Key              | Type       | Description                                     |
|------------------|------------|-------------------------------------------------|
| vpc_id           | string     | the target VPC id                               |
| region           | string     | The target AWS region to deploy the EKS cluster |
| environment      | string     | the target environment label                    |
| eks_cluster_name | string     | The kubernetes version to install in EKS        |
| subnets          | object({}) | The subnets definition                          |


# Outputs
| Key                 | Description                    |
|---------------------|--------------------------------|
| private_subnets_ids | The created private subnet ids |
| public_subnets_ids  | The created public subnet ids  |
