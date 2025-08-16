module "vpc" {
  source             = "../modules/vpc"
  project_name       = var.project_name
  cidr_block_for_VPC = var.cidr_block_for_VPC
  nat_creation       = var.nat_creation
}

module "alb_sg" {
  source              = "../modules/security_groups"
  security_group_name = "${var.project_name}-alb-sg"
  vpc_id              = module.vpc.vpc_id
  environment         = var.environment

  ingress = [
    {
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ec2_sg" {
  source              = "../modules/security_groups"
  security_group_name = "${var.project_name}-ec2-sg"
  vpc_id              = module.vpc.vpc_id
  environment         = var.environment

  ingress = [
    {
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] 
    }
  ]
}


module "alb" {
  source       = "../modules/alb"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
  subnets      = module.vpc.public_subnets
  alb_sg_id    = module.alb_sg.security_group_id
  tg_port      = 80
}


module "ec2_instance_1" {
  source            = "../modules/ec2"
  instance_name     = "${var.project_name}-app"
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.az1
  security_group    = module.ec2_sg.security_group_id
  public_subnet     = element(module.vpc.public_subnets, 0)
  volume_type       = "gp3"
  volume_size       = 8
}

module "ec2_instance_2" {
  source            = "../modules/ec2"
  instance_name     = "${var.project_name}-app"
  instance_type     = var.instance_type
  key_name          = var.key_name
  availability_zone = var.az2
  security_group    = module.ec2_sg.security_group_id
  public_subnet     = element(module.vpc.public_subnets, 1)
  volume_type       = "gp3"
  volume_size       = 8
}


resource "aws_lb_target_group_attachment" "app1" {
  target_group_arn = module.alb.target_group_arn
  target_id        = module.ec2_instance_1.instance_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app2" {
  target_group_arn = module.alb.target_group_arn
  target_id        = module.ec2_instance_2.instance_id
  port             = 80
}
