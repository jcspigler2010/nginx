
output "rke_app_domain_zone_id" {
  value       = aws_route53_zone.rke_app_domain.zone_id
  description = "Zone_ID for rke app domain"

}

output "route53_privatezone_id" {
  value       = aws_route53_zone.private.zone_id
  description = "Zone_ID for Private zone"

}
