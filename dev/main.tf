module "vpc" {
  source            = "../modules/vpc"
  vpc_cidr          = var.vpc_cidr
  pub_sub_cidr      = var.public_subnet_cidr
  vpc_name          = var.vpc_name
  availability_zone = var.availability_zone
}

module "security_group" {
  source = "../modules/security-group"
  vpc_id = module.vpc.vpc_id
  # allowed_ssh_cidr  = ["0.0.0.0/0"]
  # allowed_http_cidr = ["0.0.0.0/0"]
  ingress_rules = var.ingress_rules
}

resource "aws_key_pair" "keypem" {
  key_name   = "terra-key"
  public_key = file("./terraform-key.pub")
}

module "ec2" {
  source = "../modules/ec2"

  instance_type     = "t2.small"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = aws_key_pair.keypem.key_name
  instance_name     = "dev-ec2"
  user_data_path    = "${path.module}/userdata.sh"
}