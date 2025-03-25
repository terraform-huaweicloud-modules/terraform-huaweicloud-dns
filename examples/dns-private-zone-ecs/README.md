# Example of configuring a private domain name for an ECS instance

Configuration in this directory creates a private domain name for the ECS instance in the VPC.

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan -var-file=variables.json
terraform apply -var-file=variables.json
```

Run `terraform destroy -var-file=variables.json` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |
| Random Provider | >= 3.0.0 |

## Modules

<!-- markdownlint-disable MD013 -->
| Name | Source | Version |
|------|--------|---------|
| vpc_network | [terraform-huaweicloud-vpc](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc) | v1.2.0 |
| ecs_instance | [terraform-huaweicloud-ecs](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-ecs) | N/A |
| dns_zone | [../../modules/dns-zone](../../modules/dns-zone/README.md) | N/A |
<!-- markdownlint-enable MD013 -->

## Resources

| Name | Type |
|------|------|
| random_password.this | resource |
| data.huaweicloud_availability_zones.this | data source |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Value |
|------|-------------|-------|
| region_name | The region where the resources are located | `"cn-north-4"` |
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `"0"` |
| vpc_name | The name of the VPC to which the ECS instance belongs | `"VPC-Test"` |
| vpc_cidr | The CIDR block of the VPC to which the ECS instance belongs | `"192.168.0.0/16"` |
| subnets_configuration | The configuration for the subnets to which the ECS instance belongs | <pre>[<br>  {<br>    "name": "VPC-Subnet-Test",<br>    "cidr": "192.168.0.0/24"<br>  }<br>]</pre> |
| security_group_name | The name of the security group to which the ECS instance belongs | `"Security_Group_Test"` |
| instance_flavor_cpu_core_count | The CPU core number of the ECS instance flavor to be queried | `"4"` |
| instance_flavor_memory_size | The memory size of the ECS instance flavor to be queried | `"8"` |
| instance_image_os_type | The OS type of the IMS image to be queried that the ECS instance used | `"CentOS"` |
| instance_image_architecture | The architecture of the IMS image to be queried that the ECS instance used | `"x86"` |
| instance_name | The name of the ECS instance | `"ECS-Test"` |
| instance_disks_configuration | The disks configuration to attach to the ECS instance | <pre>[<br>  {<br>    "is_system_disk": true,<br>    "type": "SSD",<br>    "size": 200<br>  }<br>]</pre> |
| zone_name | The name of the private zone | `"private-zone.test.com"` |
| record_set_name | The name of the private record set | `"recordset.private-zone.test.com"` |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| private_zone_id | The ID of the DNS private zone |
| ecs_instance_id | The ID of the ECS instance |
| ecs_instance_private_ip | The private IP of the ECS instance |
