

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = var.pub_key
}

resource "aws_security_group" "nginx_ports" {
  vpc_id      = var.vpcid
  description = "nginx Security security group"
  name        = "nginx Enterprise Ports"
  ingress {
    from_port   = "8000"
    to_port     = "8100"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8888"
    to_port     = "8888"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8443"
    to_port     = "8443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16", "172.0.0.0/16", "10.1.0.0/16", "10.101.0.0/16"]
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name    = "nginx Ports"
    Owner   = var.owner
    Project = var.project
  }
}
