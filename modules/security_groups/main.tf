resource "aws_security_group" "this" {
  name   = var.security_group_name
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = var.security_group_name
    Environment = var.environment
  }
}
