variable "project_name" {}
variable "cidr_block_for_VPC" {}
variable "nat_creation" {
default = "yes" 
}
variable "environment" {
default = "dev"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "az1" {
  description = "AZ for first EC2"
  type        = string
}

variable "az2" {
  description = "AZ for second EC2"
  type        = string
}
