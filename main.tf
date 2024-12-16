module "vpc" {
  source           = "git::https://github.com/nandini965/tf-module-vpc-practice.git"
  for_each         = var.vpc
  cidr_block       = each.value["cidr_block"]
   subnets            = each.value["subnets"]
  #default_vpc_id = var.default_vpc_id
 # default_vpc_cidr  = var.default_vpc_cidr
  env = var.env
  azs = each.value["azs"]

}