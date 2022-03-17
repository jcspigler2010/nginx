
variable "owner" {
  type        = string
  description = "owner of project"
}

variable "ports_and_ips" {
  description = "ports and ips for aws lbs and nodes"
  type = map(object({
    lb_port = number
    member_specs = map(object({
      ip   = string
      port = number
      id   = string
    }))
  }))
}

variable "name" {
  description = "name of nlb"
  type        = string
}

variable "subnet_ids" {

  description = "subnet id aws lb connecting to"
  type        = list(string)

}

variable "vpc_id" {
  description = "vpc id was lb load balancing to"
  type        = string
}
