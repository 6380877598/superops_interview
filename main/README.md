## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ../modules/alb | n/a |
| <a name="module_alb_sg"></a> [alb\_sg](#module\_alb\_sg) | ../modules/security_groups | n/a |
| <a name="module_ec2_instance_1"></a> [ec2\_instance\_1](#module\_ec2\_instance\_1) | ../modules/ec2 | n/a |
| <a name="module_ec2_instance_2"></a> [ec2\_instance\_2](#module\_ec2\_instance\_2) | ../modules/ec2 | n/a |
| <a name="module_ec2_sg"></a> [ec2\_sg](#module\_ec2\_sg) | ../modules/security_groups | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lb_target_group_attachment.app1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_lb_target_group_attachment.app2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az1"></a> [az1](#input\_az1) | AZ for first EC2 | `string` | n/a | yes |
| <a name="input_az2"></a> [az2](#input\_az2) | AZ for second EC2 | `string` | n/a | yes |
| <a name="input_cidr_block_for_VPC"></a> [cidr\_block\_for\_VPC](#input\_cidr\_block\_for\_VPC) | n/a | `any` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"dev"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | SSH key pair name | `string` | n/a | yes |
| <a name="input_nat_creation"></a> [nat\_creation](#input\_nat\_creation) | n/a | `string` | `"yes"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | n/a |
| <a name="output_ec2_public_ips"></a> [ec2\_public\_ips](#output\_ec2\_public\_ips) | n/a |


## SuperOps Terraform Infrastructure

This Terraform project deploys the following on AWS:

- VPC with optional NAT gateways
- Security Groups for ALB and EC2
- Application Load Balancer (ALB)
- Two EC2 instances
- ALB target group attachments

---

## Usage / Run Commands

| USES | COMMAND |
|------|---------|
| <a name="command_initialize_terraform"></a> [Initialize Terraform](#command_initialize_terraform) | `terraform init` |
| <a name="command_validate_terraform"></a> [Validate Terraform](#command_validate_terraform) | `terraform validate` |
| <a name="command_plan_infrastructure"></a> [Plan Infrastructure](#command_plan_infrastructure) | `terraform plan --var-file="dev.tfvars"` |
| <a name="command_apply_infrastructure"></a> [Apply Infrastructure](#command_apply_infrastructure) | `terraform apply --var-file="dev.tfvars"` |


