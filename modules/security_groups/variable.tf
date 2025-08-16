variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security group will be created"
  type        = string
}

variable "environment" {
  description = "Environment tag (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "ingress" {
  description = <<EOT
List of ingress rules. Example:
[
  {
    port        = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    port        = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
]
EOT
  type = list(object({
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
