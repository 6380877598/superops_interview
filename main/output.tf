output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "ec2_public_ips" {
  value = [
    module.ec2_instance_1.public_ip,
    module.ec2_instance_2.public_ip
  ]
}
