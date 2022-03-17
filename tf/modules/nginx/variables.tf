variable "owner" {
  type        = string
  description = "Owner of Project Resources"
}

variable "project" {

  type    = string
  default = "Name of Project"

}

variable "tag" {

  type    = string
  default = "Name of Project"

}

variable "alt_provider_region" {

  type    = string
  default = "Alternative Region for Route53 DNS"

}

variable "vpc_id" {

  type    = string
  default = "Name of Project"

}


variable "azs" {

  description = "Run the EC2 Instances in these Availability Zones"
  type        = list(string)

}

variable "subnet_id" {

  description = "Run the EC2 Instances in these subnets"
  type        = string

}

variable "key_name" {

  type    = string
  default = "Key Name"

}

variable "instance_type" {

  type    = string
  default = "Name of Project"

}

variable "dns_zone" {

  type        = string
  description = "DNS Zone ID for nginx Record"

}

variable "dns_private_zone" {

  type        = string
  description = "DNS Private Zone ID for nginx Record"

}

variable "dns_prefix" {

  type        = string
  description = "String prefix for name and dns host A record"

}

variable "role" {

  type        = string
  description = "nginx Role"

}

variable "env" {
  type        = string
  description = "Environment nginx is being deployed in"
}


variable "servers" {

  description = "Number of Cluster Masters"
  type        = string

}

variable "security_groups" {

  description = "nginx Enterprise Security Group"
  type        = string

}

variable "private_key_ssh_connection" {

  description = "SSH key to run remote ssh commands"
  type        = string

}

variable "connection_user" {

  description = "User which runs the SSH commands"
  type        = string

}


variable "ami_owners" {
  type    = list(string)
  default = ["045324592363", "045324592363"]
}

variable "ami_description" {
  type    = list(string)
  default = ["Amazon Linux AMI 2018.03*"]
}

variable "filter_name" {
  type    = string
  default = "description"
}
