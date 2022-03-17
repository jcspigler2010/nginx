output "security_group_nginx_ports" {

  value       = aws_security_group.nginx_ports.id
  description = "Security Group for nginx Enterprise and Admin Ports"

}
