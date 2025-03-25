# DNS zone management

Manages the DNS zone resource.

## Notes

### How to import resources in the module structure

If you want to manage an existing zone using Terraform (otherwise why are you reading this?) you need to
make sure that the corresponding module script has been defined in your `.tf` file, like this:

```hcl
# Manages a DNS zone.
module "dns_zone" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-dns/modules/dns-zone"

  ...
}
```

Then, execute the following command to import the corresponding resource into the management of the `.tfstate` file.

```bash
$ terraform import module.dns_zone.huaweicloud_dns_zone.this[0] "zone_id"

module.dns_zone.huaweicloud_dns_zone.this[0]: Importing from ID "zone_id"...
module.dns_zone.huaweicloud_dns_zone.this[0]: Import complete!
  Imported huaweicloud_dns_zone (ID: zone_id)
module.dns_zone.huaweicloud_dns_zone.this[0]: Refreshing state... (ID: zone_id)

Import successful!
```

### What should we do before deploy this module example

Before manage DNS resources, the access key (AK, the corresponding environment name is `HW_ACCESS_KEY`) and the
secret key (SK, the corresponding environment name is `HW_SECRET_KEY`) should be configured.

For the linux VM, you can configure the corresponding environment variables with the following commands:

```bash
export HW_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXX
export HW_SECRET_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Refer to this [document](https://support.huaweicloud.com/intl/en-us/devg-apisign/api-sign-provide-aksk.html) for AK/SK
information obtain.

## Contributing

Report issues/questions/feature requests in the [issues](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-dns/issues/new)
section.

Full contributing [guidelines are covered here](../../.github/how_to_contribute.md).

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

No module.

## Resources

| Name | Type |
|------|------|
| huaweicloud_dns_zone.this | resource |
| huaweicloud_dns_recordset.this | resource |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Type | Default | Required |
|------|-------------|------|:-------:|:--------:|
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `string` | `""` | N |
| is_zone_create | Controls whether a zone should be created | `bool` | `true` | N |
| zone_name | The name of the zone | `string` | `""` | Y (Unless is_zone_create is specified as false) |
| zone_email | The email of the zone | `string` | `""` | N |
| zone_description | The description of the zone | `string` | `""` | N |
| zone_ttl | The ttl of the zone | `number` | `300` | N |
| zone_type | The type of the zone | `string` | `public` | N |
| zone_status | The status of the zone | `string` | `""` | N |
| zone_tags | The key/value pairs to associate with the zone | <pre>map(string)</pre> | <pre>{}</pre> | N |
| zone_proxy_pattern | The recursive resolution proxy mode for subdomains of the private zone, available when `zone_type` is `private` | `string` | `""` | N |
| zone_routers | The list of the routers of the zone, required when `zone_type` is `private` | <pre>list(object({<br>  router_id     = string<br>  router_region = optional(string, "")<br>}))</pre> | <pre>[]</pre> | N |
| record_sets_configuration | The configuration for the record set resources to which the zone belongs | <pre>list(object({<br>  zone_id     = optional(string, "")<br>  name        = string<br>  type        = string<br>  records     = list(string)<br>  ttl         = optional(number, 300)<br>  line_id     = optional(string, "")<br>  status      = optional(string, "")<br>  tags        = optional(map(string), {})<br>  description = optional(string, "")<br>  weight      = optional(number, null)<br>}))</pre> | <pre>[]</pre> | N |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| zone_id | The ID of the zone |
| zone_name | The name of the zone |
| record_sets_configuration | The basic configuration list of the record sets |
