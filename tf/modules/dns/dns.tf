data "aws_route53_zone" "selected" {
  provider = aws.comm
  zone_id  = var.dns_zone
}


resource "aws_route53_zone" "rke_app_domain" {
  provider      = aws.comm
  name          = "${var.rke_app_domain}.${data.aws_route53_zone.selected.name}"
  comment       = var.comment
  force_destroy = false
  tags          = var.tags
}

resource "aws_route53_zone" "private" {
  name = var.private_zone_name

  vpc {
    vpc_id = var.vpcid
  }
}

resource "aws_route53_record" "rke_app_domain_zone_ns_record" {
  provider = aws.comm
  zone_id  = var.dns_zone
  name     = var.rke_app_domain
  type     = "NS"
  records  = aws_route53_zone.rke_app_domain.name_servers
  ttl      = "86400"

}
