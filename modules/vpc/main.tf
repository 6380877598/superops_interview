
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block_for_VPC
  enable_dns_hostnames = true
  tags = {
   Name = "${var.project_name}-VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "${cidrsubnet(var.cidr_block_for_VPC,8,10+count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
   Name = "${var.project_name}-Public_subnet"
  }
}


resource "aws_subnet" "private_subnet" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "${cidrsubnet(var.cidr_block_for_VPC,4,1+count.index)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  tags = {
   Name = "${var.project_name}-Private_subnet"

 }
}

data "aws_availability_zones" "available" {}


resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
   Name = "${var.project_name}-IGW"
   vpc_id = "${aws_vpc.my_vpc.id}"
  }
}

resource "aws_eip" "elastic_ip" {
  count = "${var.nat_creation == "yes" ? 1: 0 }"
  tags = {
  Name = "${var.project_name}-NAT_EIP"
  vpc_id = "${aws_vpc.my_vpc.id}"
 }
}


resource "aws_nat_gateway" "nat" {
  count = "${var.nat_creation == "yes" ? 1: 0 }"
  allocation_id = aws_eip.elastic_ip[count.index].id
  subnet_id = aws_subnet.public_subnet[0].id
  tags = {
    Name = "${var.project_name}-NAT_GATEWAY"
    vpc_id = "${aws_vpc.my_vpc.id}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
   Name = "${var.project_name}-Public_RouteTable"
  }
}

resource "aws_route_table_association" "web" {
  count = "${length(data.aws_availability_zones.available.names)}"
  subnet_id = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name        = "${var.project_name}-private_rt"
  }
}

resource "aws_route" "privateroute" {
  count = "${var.nat_creation == "yes" ? 1 : 0 }"
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id =  aws_nat_gateway.nat[count.index].id
}


resource "aws_route_table_association" "public" {
  count          = "${length(data.aws_availability_zones.available.names)}"
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

