## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_secret.elasticsearch_credentials](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Namespace to deploy the secret into | `string` | n/a | yes |
| <a name="input_password_file"></a> [password\_file](#input\_password\_file) | Path to password file secret data | `string` | n/a | yes |
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | Secret name to deploy to k8s cluster | `string` | n/a | yes |
| <a name="input_username_file"></a> [username\_file](#input\_username\_file) | Path to username file secret data | `string` | n/a | yes |

## Outputs

No outputs.
