# DNS custom line management

Manages the DNS custom line resource.

## Notes

### How to import resources in the module structure

If you want to manage an existing custom line using Terraform (otherwise why are you reading this?) you need to
make sure that the corresponding module script has been defined in your `.tf` file, like this:

```hcl
# Manages a DNS custom line.
module "dns_custom_line" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-dns/modules/dns-custom-line"

  ...
}
```

Then, execute the following command to import the corresponding resource into the management of the `.tfstate` file.

```bash
$ terraform import module.dns_custom_line.huaweicloud_dns_custom_line.this[0] "custom_line_id"

module.dns_custom_line.huaweicloud_dns_custom_line.this[0]: Importing from ID "custom_line_id"...
module.dns_custom_line.huaweicloud_dns_custom_line.this[0]: Import prepared!
  Prepared huaweicloud_dns_custom_line for import
module.dns_custom_line.huaweicloud_dns_custom_line.this[0]: Refreshing state... (id=custom_line_id)

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
| huaweicloud_dns_custom_line.this | resource |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Type | Default | Required |
|------|-------------|------|:-------:|:--------:|
| is_custom_line_create | Controls whether a custom line should be created | `bool` | `true` | N |
| custom_line_name | The name of the custom line | `string` | `""` | Y (Unless is_custom_line_create is specified as false) |
| custom_line_ip_segments | The list of the IP address ranges of the custom lin | `list(string)` | `[]` | Y (Unless is_custom_line_create is specified as false) |
| custom_line_description | The description of the custom line | `string` | `""` | N |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| custom_line_id | The ID of the custom line |
