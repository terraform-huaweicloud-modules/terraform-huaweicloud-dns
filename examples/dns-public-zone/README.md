# Example of configuring a public domain name

Configuration in this directory creates a public domain name and add a record set of the custom line.

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

## Modules

<!-- markdownlint-disable MD013 -->
| Name | Source | Version |
|------|--------|---------|
| dns_custom_line | [../../modules/dns-custom-line](../../modules/dns-custom-line/README.md) | N/A |
| dns_zone | [../../modules/dns-zone](../../modules/dns-zone/README.md) | N/A |
<!-- markdownlint-enable MD013 -->

## Resources

No resource.

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Value |
|------|-------------|-------|
| region_name | The region where the resources are located | `"cn-north-4"` |
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `"0"` |
| zone_name | The name of the public zone | `"public.zone.module.test"` |
| custom_line_name | The name of the custom line | `"zone_modele_test"` |
| custom_line_ip_segments | The list of the IP address ranges of the custom line | <pre>[<br>  "1.0.0.1-1.0.0.2"<br>]</pre> |
| custom_line_description | The description of the custom line | `"Created by terraform module"` |
| record_set_name | The name of the public record set | `"www.public.zone.module.test"` |
| record_set_records | The list of the records of the public record set |  <pre>[<br>  "2.2.2.2"<br>]</pre>  |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| public_zone_id | The ID of the DNS public zone |
