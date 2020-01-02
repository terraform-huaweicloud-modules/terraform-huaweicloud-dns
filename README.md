# Huawei Cloud DNS Terraform Module

Terraform moudle which create DNS resource on Huawei Cloud.

These types of resources are supported:

* [DNS zone](https://www.terraform.io/docs/providers/huaweicloud/r/dns_zone_v2.html)
* [DNS recordset](https://www.terraform.io/docs/providers/huaweicloud/r/dns_recordset_v2.html)

## Usage

```hcl
module "example" {
  source = "terraform-huaweicloud-modules/dns/huaweicloud"

  // DNS zone
  zone_name = "example.com."
  zone_type = "public"
  email     = "admin@example.com"

  // DNS recordsets
  recordsets = [
  {
    name        = "rs1.example.com."
    description = "A zone record"
    ttl         = 600
    type        = "A"
    records     = ["10.0.0.1"]
  },
  {
    name        = "rs2.example.com."
    description = "A zone record"
    ttl         = 600
    type        = "A"
    records = ["10.0.0.2"]
  },
  ]
}
```

## Conditional creation

This module can create both DNS zone and recordsets, it is possible to use existing DNS zone only if you
specify `zone_id` parameter.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| zone_id | Specifying existing DNS zone ID | string | `""` | no  |
| zone_name | The name of the DNS zone. Note the `.` at the end of the name. | string  | `""`  | yes  |
| zone_type | The type of the DNS zone. Can either be `public` or `private`. | string  | `"public"`  | no  |
| router_id | The router UUID, required if `zone_type` is private. | string  | `""`  | no  |
| router_region | The region of the router, required if `zone_type` is private. | string  | `""`  | no  |
| email | The email contact for the zone record. | string  | `""`  | no  |
| description | A description of the DNS zone. | string  | `""`  | no  |
| recordsets  | List of record sets in the DNS zone. | list(object)  | `[]`  | yes  |


## Outputs

| Name | Description |
|------|-------------|
| this_dns_zone_id | The ID of the DNS zone |
| this_dns_recordset_ids | The IDs of the recordsets |

Authors
----
Created and maintained by [ShiChangkuo](https://github.com/ShiChangkuo)

License
----
Apache 2 Licensed. See LICENSE for full details.
