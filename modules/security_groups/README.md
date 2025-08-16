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
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment tag (e.g., dev, stage, prod) | `string` | `"dev"` | no |
| <a name="input_ingress"></a> [ingress](#input\_ingress) | List of ingress rules. Example:<br/>[<br/>  {<br/>    port        = 80<br/>    protocol    = "tcp"<br/>    cidr\_blocks = ["0.0.0.0/0"]<br/>  },<br/>  {<br/>    port        = 22<br/>    protocol    = "tcp"<br/>    cidr\_blocks = ["10.0.0.0/16"]<br/>  }<br/>] | <pre>list(object({<br/>    port        = number<br/>    protocol    = string<br/>    cidr_blocks = list(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the security group | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where security group will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
