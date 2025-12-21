# NAT module
Creates NAT gateways

# Variables
| Key                | Type         | Description                                    |
|--------------------|--------------|------------------------------------------------|
| environment        | string       | the target environment label                   |
| public_subnets_ids | list(string) | the public subnets ids to attach a nat gateway |

# Outputs
| Key             | Description          |
|-----------------|----------------------|
| nat_gateway_ids | The NAT gateways IDs |
