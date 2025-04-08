# DNS PTR record management

Manages the DNS PTR record resource.

## Notes

### How to import resources in the module structure

If you want to manage an existing zone using Terraform (otherwise why are you reading this?) you need to
make sure that the corresponding module script has been defined in your `.tf` file, like this:

```hcl
# Manages a DNS PTR record.
module "dns_ptrrecord" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-dns/modules/dns-ptrrecord"

  ...
}
```

Then, execute the following command to import the corresponding resource into the management of the `.tfstate` file.

```bash
$ terraform import module.dns_ptrrecord.huaweicloud_dns_ptrrecord.this[0] "ptrrecord_id"

module.dns_ptrrecord.huaweicloud_dns_ptrrecord.this[0]: Importing from ID "ptrrecord_id"...
module.dns_ptrrecord.huaweicloud_dns_ptrrecord.this[0]: Import prepared!
  Prepared huaweicloud_dns_ptrrecord for import
module.dns_ptrrecord.huaweicloud_dns_ptrrecord.this[0]: Refreshing state... (id=ptrrecord_id)

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
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
| huaweicloud_dns_ptrrecord.this | resource |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Type | Default | Required |
|------|-------------|------|:-------:|:--------:|
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `string` | `""` | N |
| is_ptrrecord_create | Controls whether a PTR record should be created | `bool` | `true` | N |
| ptrrecord_name | The domain name of the PTR record | `string` | `""` | Y (Unless `is_ptrrecord_create` is specified as false) |
| ptrrecord_floatingip_id | The ID of the GEIP/EIP | `string` | `""` | Y (Unless `is_ptrrecord_create` is specified as false) |
| ptrrecord_ttl | The TTL of the PTR record | `number` | `null` | N |
| ptrrecord_description | The description of the PTR record | `string` | `""` | N |
| zone_tags | The key/value pairs to associate with the PTR record | <pre>map(string)</pre> | <pre>{}</pre> | N |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| ptrrecord_id | The ID of the PTR record, the format is `{region}:{floatingip_id}` |
| ptrrecord_associated_address | The address of the GEIP/EIP associated with PTR record |
