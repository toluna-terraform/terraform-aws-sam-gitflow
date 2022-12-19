<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codebuild_project.codebuild](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |
| [aws_iam_role.codebuild_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cloudWatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.codebuild_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.codebuild_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_s3_bucket.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_buildspec_file"></a> [buildspec\_file](#input\_buildspec\_file) | n/a | `string` | n/a | yes |
| <a name="input_codebuild_name"></a> [codebuild\_name](#input\_codebuild\_name) | n/a | `string` | n/a | yes |
| <a name="input_codedeploy_role"></a> [codedeploy\_role](#input\_codedeploy\_role) | n/a | `string` | n/a | yes |
| <a name="input_enable_jira_automation"></a> [enable\_jira\_automation](#input\_enable\_jira\_automation) | n/a | `bool` | `false` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | n/a | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | n/a | `map(string)` | `{}` | no |
| <a name="input_environment_variables_parameter_store"></a> [environment\_variables\_parameter\_store](#input\_environment\_variables\_parameter\_store) | n/a | `map(string)` | <pre>{<br>  "ADO_PASSWORD": "/app/ado_password",<br>  "ADO_USER": "/app/ado_user"<br>}</pre> | no |
| <a name="input_privileged_mode"></a> [privileged\_mode](#input\_privileged\_mode) | set to true if building a docker | `bool` | `true` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | n/a | `string` | n/a | yes |
| <a name="input_source_branch"></a> [source\_branch](#input\_source\_branch) | n/a | `string` | `"master"` | no |
| <a name="input_source_repository"></a> [source\_repository](#input\_source\_repository) | n/a | `string` | `"chorus"` | no |
| <a name="input_source_repository_url"></a> [source\_repository\_url](#input\_source\_repository\_url) | n/a | `string` | `"https://bitbucket.org/tolunaengineering/chorus.git"` | no |
| <a name="input_vpc_config"></a> [vpc\_config](#input\_vpc\_config) | n/a | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attributes"></a> [attributes](#output\_attributes) | n/a |
<!-- END_TF_DOCS -->