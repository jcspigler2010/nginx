variable "owner" {
  type        = string
  description = "Owner of Project."
}

variable "project" {
  type        = string
  description = "Owner of Project."
}

variable "tags" {

  type        = map(string)
  description = "Tags for Security groups"
}

variable "rke_app_domain" {
  default     = "a"
  description = "rke cluster default app subdomain name.  NOT THE ENTIRE FQDN!"
}

variable "dns_zone" {
  description = "Public DNS Zone ID for rke cluster"
}

variable "comment" {
  description = "comment for Route53 annotation"
  default     = "Route53 sub domain for rke apps"
}

# variable "master_fqdn" {
#   description = "rke Master FQDN to create console and wild card records"
# }

variable "vpcid" {
  description = "VPC ID for private zone"
}

variable "private_zone_name" {
  description = "Private zone name"
}
