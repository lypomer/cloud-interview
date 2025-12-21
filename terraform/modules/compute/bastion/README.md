# Internet gateway module
Creates an internet gateway

# Variables
| Key                 | Type   | Description                                                        |
|---------------------|--------|--------------------------------------------------------------------|
| ssh_public_key_path | string | the SSH public key path                                            |
| environment         | string | the target environment label                                       |
| vpc_id              | string | the target VPC id                                                  |
| public_subnet_id    | string | the public subnet to access the bastion                            |
| maintainer_ip       | string | the use IP to whitelist to access the bastion, defaults to all IPs |

# Outputs
| Key        | Description    |
|------------|----------------|
| bastion_ip | The bastion IP |
