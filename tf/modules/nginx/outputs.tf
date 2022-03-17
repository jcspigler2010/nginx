output "nginx_ent_public_ip" {

  value = { for k, s in aws_instance.nginx_node : "${var.dns_prefix}${var.role}${k}" => s.public_ip }

}

output "nginx_ent_private_ip" {

  value = { for k, s in aws_instance.nginx_node : "${var.dns_prefix}${var.role}${k}" => s.private_ip }

}


output "nginx_ent_public_fqdn" {

  value = { for k, s in aws_route53_record.nginx_ent_dns : "${var.dns_prefix}${var.role}${k}" => s.fqdn }

}

output "nginx_ent_private_fqdn" {

  value = { for k, s in aws_route53_record.nginx_private_dns : "${var.dns_prefix}${var.role}${k}" => s.fqdn }

}

output "nginx_ent_instance_id" {

  value = { for k, s in aws_instance.nginx_node : "${var.dns_prefix}${var.role}${k}" => s.id }

}
