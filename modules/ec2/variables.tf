variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the EC2 instance"
  type        = string
}

variable "security_group" {
  description = "Security Group ID for the EC2 instance"
  type        = string
}

variable "public_subnet" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile (optional)"
  type        = string
  default     = null
}

variable "volume_type" {
  description = "EBS volume type"
  type        = string
  default     = "gp3"
}

variable "volume_size" {
  description = "EBS volume size in GB"
  type        = number
  default     = 8
}
