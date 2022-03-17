data "aws_ami" "latest_amz_image" {
  most_recent = true
  owners      = var.ami_owners # Canonical

  filter {
    name   = var.filter_name
    values = var.ami_description
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnet" "nginx_subnet" {

  id = var.subnet_id

}
