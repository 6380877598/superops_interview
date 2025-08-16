variable "project_name" {
  description = "Project/Environment name prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB and Target Group will be created"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security Group ID for ALB"
  type        = string
}

variable "tg_port" {
  description = "Port for Target Group"
  type        = number
  default     = 80
}
