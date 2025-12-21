# VPC module
Creates a VPC

# Variables
| Key            | Type   | Description                                  |
|----------------|--------|----------------------------------------------|
| vpc_cidr_block | string | The base CIDR block to setup the VPC network |
| environment    | string | the target environment label                 |

# Outputs
| Key          | Description              |
|--------------|--------------------------|
| vpc_id       | The created VPC id       |
