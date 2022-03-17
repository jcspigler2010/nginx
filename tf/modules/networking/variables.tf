variable "cidr_block" {
  type        = string
  description = "CIDR block used by VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name of VPC."
}

variable "owner" {
  type        = string
  description = "Owner of Project."
}

variable "nginx_subnets" {
  description = "A map of availability zones to CIDR blocks, which will be set up as private subnets."
  type = map(object({
    network_number    = number
    availability_zone = string
    tags              = map(string)
  }))

}

variable "private_zone_name" {

  description = "Private Route53 Zone"
  type        = string

}
