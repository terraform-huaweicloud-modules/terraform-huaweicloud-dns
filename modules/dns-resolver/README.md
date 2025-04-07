# Resolver management

Manages the resolver resource.

## Notes

### How to import resources in the module structure

If you want to manage an existing resolver using Terraform (otherwise why are you reading this?) you need to
make sure that the corresponding module script has been defined in your `.tf` file, like this:

```hcl
# Manages a resolver.
module "dns_resolver" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-dns/modules/dns-resolver"

  ...
}
```

Then, execute the following command to import the corresponding resource into the management of the `.tfstate` file.

```bash
$ terraform import module.dns_resolver.huaweicloud_dns_endpoint_assignment.this[0] "endpoint_id"

module.dns_resolver.huaweicloud_dns_endpoint_assignment.this[0]: Importing from ID "endpoint_id"...
module.dns_resolver.huaweicloud_dns_endpoint_assignment.this[0]: Import complete!
  Imported huaweicloud_dns_endpoint_assignment (ID: endpoint_id)
module.dns_resolver.huaweicloud_dns_endpoint_assignment.this[0]: Refreshing state... (ID: endpoint_id)

Import successful!
```

### What should we do before deploy this module example

Before manage NAT resources, the access key (AK, the corresponding environment name is `HW_ACCESS_KEY`) and the secret
key (SK, the corresponding environment name is `HW_SECRET_KEY`) should be configured.

For the linux VM, you can configure the corresponding environment variables with the following commands:

```bash
$ export HW_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXX
$ export HW_SECRET_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
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
| huaweicloud_dns_endpoint_assignment.this | resource |
| huaweicloud_dns_resolver_rule.this | resource |
| huaweicloud_dns_resolver_rule_associate.this | resource |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Type | Default | Required |
|------|-------------|------|:-------:|:--------:|
| is_endpoint_create | Controls whether a endpoint should be created | `bool` | `true` | N |
| endpoint_name | The name of the endpoint | `string` | `""` | Y (Unless `is_endpoint_create` is specified as false) |
| endpoint_type | The type of the endpoint | `string` | `""` | Y (Unless `is_endpoint_create` is specified as false) |
| endpoint_assignments | The list of the IP addresses of the endpoint | <pre>list(object({<br>  subnet_id  = string<br>  ip_address = string<br>}))</pre> | <pre>[]</pre> | N |
| resolver_rules_configuration | The configuration list of the resolver rules | <pre>list(object({<br>  endpoint_id  = optional(string, "")<br>  name         = string<br>  domain_name  = string<br>  ip_addresses = list(string)<br>}))</pre> | <pre>[]</pre> | N |
| resolver_rule_associates_configuration | The configuration of the resolver rules associated with VPCs | <pre>list(object({<br>  resolver_rule_id = string<br>  vpc_id           = string<br>}))</pre> | <pre>[]</pre> | N |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| endpoint_id | The ID of the endpoint |
| endpoint_assignments | The list of assigned IP addresses under specified endpoint |
| resolver_rules_configuration | The basic configuration list of the resolver rules |
| resolver_rules_associate_vpcs_configuration | The VPCs associated with resolver rules |
