module "vpc" {
  source    = "git::https://github.com/nandini965/tf-vpc-module-practice.git"
  for_each   = var.vpc
  cidr_block = each.value["cidr_block"]
  vpc_id = var.vpc_id