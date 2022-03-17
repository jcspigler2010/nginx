resource "aws_eip" "f5_vs" {
  provider                  = aws.gov
  vpc                       = true
  network_interface         = var.ext_interface_id
  associate_with_private_ip = var.private_ip

}
