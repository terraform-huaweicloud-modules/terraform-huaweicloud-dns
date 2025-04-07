# Outbound endpoint and resolver rules

Configuration in this directory creates these resource:

+ Two VPC
+ A subnet under the VPC
+ A resolver rule under the endpoint
+ Three VPCs are associated with the zone and resolver rules
+ A DNS zone
+ Two rules are associated with two VPCs respectively

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
| dns_zone | [../../modules/dns-zone](../../modules/dns-zone/README.md) | N/A |
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
| vpc_network_configurations | The configuration VPCs and subnets to which the endpoint or resolver rule belongs | <pre>[<br>  {<br>    "vpc_name": "VPC-Test-Zone",<br>    "vpc_cidr": "172.16.0.0/16",<br>    "subnets_configuration": [<br>      {<br>        "name": "Subnet-Test",<br>        "cidr": "172.16.0.0/24"<br>      }<br>    ]<br>  },<br> {<br>    "vpc_name": "VPC-Test-1",<br>    "vpc_cidr": "172.16.0.0/16",<br>    "subnets_configuration": [<br>      {<br>        "name": "Subnet-1-1",<br>        "cidr": "172.16.0.0/24"<br>      }<br>    ]<br>  },<br>  {<br>    "vpc_name": "VPC-Test-1",<br>    "vpc_cidr": "172.16.0.0/16",<br>    "subnets_configuration": [<br>      {<br>        "name": "Subnet-1-1",<br>        "cidr": "172.16.0.0/24"<br>      }<br>    ]<br>  }<br>]</pre> |
| zone_name | The name of the DNS zone | `"resolver.zone.name.com."` |
| zone_type | The type of the DNS zone | `"private"` |
| endpoint_name | The name of the endpoint | `"Endpoint-Test"` |
| endpoint_type | The type of the endpoint | `"outbound"` |
| endpoint_ip_addresses | The list of the IP addresses of the endpoint | <pre>[<br>  "172.16.0.10",<br>  "172.16.0.11"<br>]</pre> |
| resolver_rules_configuration | The configuration list of the resolver rules |  <pre>[<br>  {<br>    "name": "Rule-Test",<br>    "ip_addresses": [<br>      "192.168.2.100",<br>      "192.168.2.101"<br>    ]<br>  },<br>  {<br>    "name": "Rule-Test2",<br>    "ip_addresses": [<br>      "172.168.2.100",<br>      "172.168.2.101"<br>    ]<br>  }<br>]</pre> |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| endpoint_id | The ID of the outbound endpoint |
| endpoint_assignments | The list of IP addresses assigned to the outbound endpoint |
| resolver_rules_configuration | The basic configuration list of the resolver rules |
| resolver_rules_associate_vpcs_configuration | The VPCs configuration for the resolver rules |
