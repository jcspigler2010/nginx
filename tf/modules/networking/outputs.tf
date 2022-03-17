output "vpcid" {

  value       = aws_vpc.nginx_vpc.id
  description = "VPC ID for nginx Enterprise."

}

output "nginx_subnet" {

  # value  = values(aws_subnet.ose_subnet)[*]["id"]
  value       = { for k, s in aws_subnet.nginx_subnet : k => s.id }
  description = "nginx Subnets"

}

output "output_nginx_subnet" {

  # value  = values(aws_subnet.ose_subnet)[*]["id"]
  value       = { for k, s in aws_subnet.nginx_subnet : k => s.id }
  description = "nginx Subnets"

}

output "route53_privatezone_id" {

  value       = aws_route53_zone.private.zone_id
  description = "nginx VPC Private Route53 Zone"

}
