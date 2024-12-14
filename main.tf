module "vpc" {
  source           = "git::https://github.com/nandini965/tf-module-vpc-practice.git"
  for_each         = var.vpc
  cidr_block       = each.value["cidr_block"]
   subnets            = each.value["subnets"]
  default_vpc_cidr = each.value["default_vpc_cidr"]
  default_vpc_id  = each.value["default_vpc_id"]
}