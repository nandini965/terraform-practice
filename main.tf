module "vpc" {
  source           = "git::https://github.com/nandini965/tf-module-vpc-practice.git"
  for_each         = var.vpc
  cidr_block       = each.value["cidr_block"]
  default_vpc_id   = var.default_vpc_id
}