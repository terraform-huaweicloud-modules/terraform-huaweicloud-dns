# Inbound endpoint

Configuration in this directory creates these resource:

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan -var-file=variables.json
$ terraform apply -var-file=variables.json
```

Run `terraform destroy -var-file=variables.json` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

<!-- markdownlint-disable MD013 -->
| Name | Source | Version |
|------|--------|---------|
| vpc_network | [terraform-huaweicloud-vpc](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-vpc) | v1.2.0 |
| dns_resolver | [../../modules/dns-resolver](../../modules/dns-resolver/README.md) | N/A |
<!-- markdownlint-enable MD013 -->

## Resources

| Name | Type |
|------|------|
| data.huaweicloud_availability_zones.this | data source |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Value |
|------|-------------|-------|
| region_name | The region where the resources are located | `"cn-north-4"` |
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `"0"` |
| vpc_name | The name of the VPC to which the endpoint belongs | `"VPC-Test-Inbound"` |
| vpc_cidr | The CIDR block of the VPC to which the endpoint belongs | `"172.16.0.0/16"` |
| subnets_configuration | The configuration for the subnets to which the endpoint belongs | <pre>[<br>  {<br>    "name": "Subnet-Inbound",<br>    "cidr": "192.16.0.0/24"<br>  }<br>]</pre> |
| endpoint_name | The name of the endpoint | `"Endpoint-Test"` |
| endpoint_type | The type of the endpoint | `"inbound"` |
| endpoint_ip_addresses | The list of the IP addresses of the endpoint | <pre>[<br>  "172.16.0.10",<br>  "172.16.0.11"<br>]</pre> |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| endpoint_id | The ID of the inbound endpoint |
| endpoint_assignments | The list of IP addresses assigned to the inbound endpoint |
