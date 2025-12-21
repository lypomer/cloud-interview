# Routes module
Creates routes and subnet associations

# Variables
| Key                 | Type         | Description             |
|---------------------|--------------|-------------------------|
| vpc_id              | string       | the target VPC id       |
| igw_id              | string       | an  internet gateway id |
| nat_gateway_id      | string       | the NAT gateway ids     |
| public_subnets_ids  | list(string) | the public subnets ids  |
| private_subnets_ids | list(string) | the private subnets ids |

# Outputs
N/A
