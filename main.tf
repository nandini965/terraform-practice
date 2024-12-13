module "vpc" {
  source           = "git::https://github.com/nandini965/terraform-practice.git"
  for_each         = var.vpc
  cidr_block       = each.value["cidr_block"]
  env              = var.env
  vpc_id           = var.vpc
  default_vpc_id   = var.default_vpc_id
  default_vpc_cidr = var.default_vpc_cidr
}