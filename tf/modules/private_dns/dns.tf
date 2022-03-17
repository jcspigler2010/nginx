resource "aws_route53_zone" "private" {
  name          = var.private_zone_name
  force_destroy = true
  vpc {
    vpc_id = var.vpc_id
  }
}
