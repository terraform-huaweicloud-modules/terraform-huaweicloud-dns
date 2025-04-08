# Example of configuring PTR record for an ECS instance

Configuration in this directory creates a PTR record and an ECS instance.

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
| eip_publicip | [terraform-huaweicloud-vpc](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-eip/modules/eip-publicip) | N/A |
| dns_ptrrecord | [../../modules/dns-ptrrecord](../../modules/dns-ptrrecord/README.md) | N/A |
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
| vpc_name | The name of the VPC to which the ECS instance belongs | `"vpc_test_for_ecs"` |
| vpc_cidr | The CIDR block of the VPC to which the ECS instance belongs | `"192.168.0.0/16"` |
| subnets_configuration | The configuration for the subnets to which the ECS instance belongs | <pre>[<br>  {<br>    "name": "vpc_subnet_test_for_ecs",<br>    "cidr": "192.168.0.0/24"<br>  }<br>]</pre> |
| security_group_name | The name of the security group to which the ECS instance belongs | `"security_group_for_ecs"` |
| instance_flavor_cpu_core_count | The CPU core number of the ECS instance flavor to be queried | `"4"` |
| instance_flavor_memory_size | The memory size of the ECS instance flavor to be queried | `"8"` |
| instance_image_os_type | The OS type of the IMS image to be queried that the ECS instance used | `"CentOS"` |
| instance_image_architecture | The architecture of the IMS image to be queried that the ECS instance used | `"x86"` |
| instance_name | The name of the ECS instance | `"ecs_for_ptrrecord"` |
| eip_publicip_configuration | The configuration for the elastic IP | <pre>[<br>  {<br>    "type": "5_bgp"<br>  }<br>]</pre> |
| eip_bandwidth_configuration | The bandwidth configuration for the elastic IP | <pre>[<br>  {<br>    "share_type": "PER",<br>    "name":"bandwidth_test",<br>    "size": 5<br>  }<br>]</pre> |
| eip_name | The name of the elastic IP | `"eip_ipv4_test"` |
| ptrrecord_name | The name of the PTR record | `"ptr.record.test.com."` |
| ptrrecord_ttl | The TTL of the PTR record | `600` |
| ptrrecord_description | The description of the PTR record | `"PTR record module test"` |
| ptrrecord_tags | The key/value pairs to associate with the PTR record | <pre>{<br>  "foo": "bar" <br>}</pre> |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| ecs_instance_id | The ID of the ECS instance associated with the elastic IP |
| ptrrecord_id | The ID of the PTR record |
