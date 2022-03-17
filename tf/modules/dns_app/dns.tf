
resource "aws_route53_record" "nginx_app_fqdn" {
  provider = aws.comm
  zone_id  = var.dns_zone
  name     = var.hostname
  type     = "CNAME"
  ttl      = "300"
  records  = var.records
}
