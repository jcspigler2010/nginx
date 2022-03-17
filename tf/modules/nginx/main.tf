
provider "aws" {
  alias = "comm"
}


resource "aws_instance" "nginx_node" {
  count                       = var.servers
  ami                         = data.aws_ami.latest_amz_image.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true
  availability_zone           = element(var.azs, count.index)
  subnet_id                   = data.aws_subnet.nginx_subnet.id
  vpc_security_group_ids      = [var.security_groups]
  tags = {
    Name    = "${var.dns_prefix}${var.role}${count.index}"
    Owner   = var.owner
    Project = var.project
    Role    = var.role
    Env     = var.env
  }

  root_block_device {
    volume_size = 100
  }

}


resource "aws_route53_record" "nginx_ent_dns" {
  provider = aws.comm
  count    = var.servers
  zone_id  = var.dns_zone
  name     = "${var.dns_prefix}${var.role}${count.index}"
  type     = "A"
  ttl      = "300"
  records  = [element(aws_instance.nginx_node.*.public_ip, count.index)]
}

resource "aws_route53_record" "nginx_private_dns" {
  count   = var.servers
  zone_id = var.dns_private_zone
  name    = "${var.dns_prefix}${var.role}${count.index}"
  type    = "A"
  ttl     = "300"
  records = [element(aws_instance.nginx_node.*.private_ip, count.index)]
}
