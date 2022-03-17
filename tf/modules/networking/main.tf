provider "aws" {
  alias = "comm"
}


resource "aws_vpc" "nginx_vpc" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name  = var.vpc_name
    Owner = var.owner
  }
}


resource "aws_internet_gateway" "nginxvpc_gw" {

  vpc_id     = aws_vpc.nginx_vpc.id
  depends_on = [aws_vpc.nginx_vpc]
  tags = {
    Name  = "${var.vpc_name}_default_gw"
    Owner = var.owner
  }

}


resource "aws_subnet" "nginx_subnet" {
  for_each          = var.nginx_subnets
  vpc_id            = aws_vpc.nginx_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.nginx_vpc.cidr_block, 8, each.value.network_number)
  availability_zone = each.value.availability_zone
  depends_on        = [aws_vpc.nginx_vpc]
  tags              = each.value.tags
}


resource "aws_route" "r" {

  route_table_id         = aws_vpc.nginx_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.nginxvpc_gw.id
  depends_on             = [aws_vpc.nginx_vpc]

}

resource "aws_route53_zone" "private" {
  name          = var.private_zone_name
  force_destroy = true
  vpc {
    vpc_id = aws_vpc.nginx_vpc.id
  }
}
