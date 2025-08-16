
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] 

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "this" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  availability_zone           = var.availability_zone
  vpc_security_group_ids      = [var.security_group]
  subnet_id                   = var.public_subnet
  iam_instance_profile        = var.iam_instance_profile

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
    echo "<h1>Hello World from ${var.instance_name}!</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = var.instance_name
  }
}
