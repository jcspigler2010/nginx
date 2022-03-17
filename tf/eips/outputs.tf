output "eip_public_ip" {

  value = { for k, s in aws_eip.f5_vs : k => s }

}
