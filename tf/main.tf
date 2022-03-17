#### default AWS gov provider ####

provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "gov"
  region                  = "us-gov-east-1"
}

provider "aws" {
  alias                   = "west"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "gov"
  region                  = "us-gov-west-1"
}

provider "aws" {
  alias                   = "comm"
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "sharkcloud"
}



######EAST######

# module "networking" {
#
#   providers = {
#     aws      = aws
#     aws.comm = aws.comm
#   }
#
#   source            = "./modules/networking"
#   cidr_block        = "10.0.0.0/16"
#   vpc_name          = "nginx_core"
#   owner             = "Jonathan Spigler"
#   private_zone_name = "nginx.cloudmegalodon.local"
#   nginx_subnets = {
#
#     nginx_site_a = {
#       network_number    = 1
#       availability_zone = "us-gov-east-1a"
#       tags = {
#         Owner   = "Jonathan Spigler"
#         Project = "NGINX Core"
#         env     = "gov-east-1"
#       }
#     }
#     nginx_site_b = {
#       network_number    = 2
#       availability_zone = "us-gov-east-1b"
#       tags = {
#         Owner   = "Jonathan Spigler"
#         Project = "NGINX Core"
#         env     = "gov-east-1"
#       }
#     }
#   }
#
# }

module "global_ec2" {
  providers = {
    aws      = aws
    aws.comm = aws.comm
  }
  #### Commerical AWS provider for Route53 ####

  source   = "./modules/ec2"
  owner    = "Jonathan Spigler"
  project  = "nginx cores"
  vpcid    = "vpc-0e72937da1e92ca85"
  key_name = "nginx"
  pub_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFme8C8U9qJKYMdI34wWHV+1maXCRTsPCuLmm5lbOXP03RkecpzS7SUVed/UixCYRzzyVKzoJ1AmTMpVvd/6UyTDivufd7PZHhb4oKhMp0TYyku2YgRKlZ/HTdtWXojsEEqxmx6Md+IVudCtz8n1qNt22Ve87HSRgtFFlWwj6aogBQqPQDOMmOd7OPe+REwIDJDVRHIbtDKexhmtSqLx3hn7EhMqjC4TD6Dpgbf6l1VGCgIx6GWbfQW1s12rLiTotNSVJLhwlStS9xYTxJOkqAe/Wkki0Eee3v0+VDv32wmFN+ElJrvnoppq3F5veWS5SzhFjRKLnyQHpwqURW7lwY5z6hJPjkShMDxkqQaRC4CfXb1xwQ0Q68buMlQ2q3xax7MPraKYYw3H7xHopBxh+CB7pgcaIpw3ANXDj4qPOLE4nS06nzCt210kFgx1kBixKRioVIG9hRCRUzZnxpUIzdXUV0bCcsm9jOZ9GSSNkfFfSFFOl76TbZ/61GdpNmnMc= jonathanspigler@jonathans-mbp.lan"

}


module "nginx1" {


  providers = {
    aws      = aws
    aws.comm = aws.comm
  }
  dns_zone                   = "Z2D5ILIPOX7KYA"
  dns_private_zone           = module.nginx_private_zone.private_zone_id
  source                     = "./modules/nginx"
  alt_provider_region        = "us-east-1"
  owner                      = "Jonathan Spigler"
  project                    = "NGINX Core"
  dns_prefix                 = "nginx"
  private_key_ssh_connection = "nginx"
  connection_user            = "ec2-user"
  role                       = "lb"
  env                        = "spigler"
  servers                    = 1
  key_name                   = "nginx"
  instance_type              = "t3a.2xlarge"
  ami_description            = ["ami-01fc0ea55e16cfa0e"]
  filter_name                = "image-id"
  ami_owners                 = ["045324592363"]
  security_groups            = module.global_ec2.security_group_nginx_ports


  azs = [
    "us-gov-east-1a"
  ]

  subnet_id = "subnet-0987386628239ca4e"

}

module "nginx_web" {


  providers = {
    aws      = aws
    aws.comm = aws.comm
  }
  dns_zone                   = "Z2D5ILIPOX7KYA"
  dns_private_zone           = module.nginx_private_zone.private_zone_id
  source                     = "./modules/nginx"
  alt_provider_region        = "us-east-1"
  owner                      = "Jonathan Spigler"
  project                    = "NGINX Core"
  dns_prefix                 = "tomcat"
  private_key_ssh_connection = "nginx"
  connection_user            = "ec2-user"
  role                       = "server"
  env                        = "spigler"
  servers                    = 1
  key_name                   = "nginx"
  instance_type              = "t3a.2xlarge"
  ami_description            = ["ami-01fc0ea55e16cfa0e"]
  filter_name                = "image-id"
  ami_owners                 = ["045324592363"]
  security_groups            = module.global_ec2.security_group_nginx_ports


  azs = [
    "us-gov-east-1a"
  ]

  subnet_id = "subnet-0987386628239ca4e"

}

module "nginx_private_zone" {

  source            = "./modules/private_dns"
  vpc_id            = "vpc-0e72937da1e92ca85"
  private_zone_name = "nginx.local"
}

# module "nginx_nlb" {
#   source = "./modules/nlb"
#   owner  = "Jonathan Spigler"
#   name   = "nginx-nlb1"
#   subnet_ids = [
#     module.networking.nginx_subnet["nginx_site_a"]
#   ]
#   vpc_id = module.networking.vpcid
#
#   ports_and_ips = {
#     https = {
#       lb_port = 443
#       member_specs = {
#         nginx1 = {
#           port = 443
#           ip   = module.nginx1.nginx_ent_private_ip["nginxlb0"]
#           id   = module.nginx1.nginx_ent_instance_id["nginxlb0"]
#         },
#       }
#     },
#     http = {
#       lb_port = 80
#       member_specs = {
#         nginx1 = {
#           port = 80
#           ip   = module.nginx1.nginx_ent_private_ip["nginxlb0"]
#           id   = module.nginx1.nginx_ent_instance_id["nginxlb0"]
#         },
#       }
#     }
#   }
# }


# module "waas_record" {
#   providers = {
#     aws      = aws
#     aws.comm = aws.comm
#   }
#   dns_zone = module.dns.rke_app_domain_zone_id
#   source   = "./modules/dns_app"
#   records  = [module.rancher_nlb.lb_dns]
#   hostname = "rancher"
#   type     = "CNAME"
#
# }
