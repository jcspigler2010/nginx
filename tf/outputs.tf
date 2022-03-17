
output "nginx1_public_ip" {
  value = module.nginx1.nginx_ent_public_ip
}


output "nginx1_private_ip" {
  value = module.nginx1.nginx_ent_private_ip
}


output "nginx1_public_fqdn" {
  value = module.nginx1.nginx_ent_public_fqdn
}


output "nginx1_private_fqdn" {
  value = module.nginx1.nginx_ent_private_fqdn
}



output "nginx_web_public_ip" {
  value = module.nginx_web.nginx_ent_public_ip
}


output "nginx_web_private_ip" {
  value = module.nginx_web.nginx_ent_private_ip
}


output "nginx_web_public_fqdn" {
  value = module.nginx_web.nginx_ent_public_fqdn
}


output "nginx_web_private_fqdn" {
  value = module.nginx_web.nginx_ent_private_fqdn
}
