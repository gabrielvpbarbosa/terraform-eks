# terraform-eks

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | ./module/cluster | n/a |
| <a name="module_cluster_autoscaler"></a> [cluster\_autoscaler](#module\_cluster\_autoscaler) | git::https://github.com/DNXLabs/terraform-aws-eks-cluster-autoscaler.git | n/a |
| <a name="module_helm-charts"></a> [helm-charts](#module\_helm-charts) | ./module/helm-charts | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./module/network | n/a |
| <a name="module_nodes"></a> [nodes](#module\_nodes) | ./module/nodes | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_cluster-name"></a> [cluster-name](#input\_cluster-name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `string` | n/a | yes |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | n/a | `number` | n/a | yes |
| <a name="input_instance_desired_size"></a> [instance\_desired\_size](#input\_instance\_desired\_size) | n/a | `number` | n/a | yes |
| <a name="input_instance_max_size"></a> [instance\_max\_size](#input\_instance\_max\_size) | n/a | `number` | n/a | yes |
| <a name="input_instance_min_size"></a> [instance\_min\_size](#input\_instance\_min\_size) | n/a | `number` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_region_provider"></a> [region\_provider](#input\_region\_provider) | n/a | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | n/a | `string` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->