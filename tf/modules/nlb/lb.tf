resource "aws_lb" "rancher" {

  name                             = var.name
  internal                         = false
  load_balancer_type               = "network"
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false
  subnets                          = var.subnet_ids

  tags = {

    owner = var.owner
    name  = var.name

  }
}

locals {
  lb_specs = flatten([
    for protocol, lb_entry in var.ports_and_ips : [
      for member_spec_key, member_spec in lb_entry.member_specs : {
        lb_port     = lb_entry.lb_port
        protocol    = protocol
        member_name = member_spec_key
        member_port = member_spec.port
        member_ip   = member_spec.ip
        member_id   = member_spec.id
      }
    ]
  ])
}

output "lb_specs_output" {
  value = local.lb_specs

}

resource "aws_lb_listener" "rancher" {
  for_each          = var.ports_and_ips
  load_balancer_arn = aws_lb.rancher.arn
  protocol          = "TCP"
  port              = each.value.lb_port

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rancher[each.key].arn
  }
}

resource "aws_lb_target_group" "rancher" {
  for_each = var.ports_and_ips
  port     = each.value.lb_port
  protocol = "TCP"
  vpc_id   = var.vpc_id

  depends_on = [
    aws_lb.rancher
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "rancher" {
  for_each = {
    for member_entry in local.lb_specs : "${member_entry.member_name}.${member_entry.member_port}" => member_entry
  }

  target_group_arn = aws_lb_target_group.rancher[each.value.protocol].arn
  target_id        = each.value.member_id
  port             = each.value.member_port
}
