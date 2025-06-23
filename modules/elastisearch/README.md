## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.elasticsearch](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Namespace to deploy the helm chart into | `string` | n/a | yes |
| <a name="input_release_name"></a> [release\_name](#input\_release\_name) | Helm release name | `string` | n/a | yes |

## Outputs

No outputs.
