env = "dev"
default_vpc_id = "vpc-047928c0531911b2b"
default_vpc_cidr = "172.31.0.0/16"
vpc = {
main = {
cidr_block = "10.0.0.0/16"
  subnets = {
    public = {
      name = "public"
      cidr_block = "10.0.0.0/17"
    }
    private = {
      name = "private"
      cidr_block = "10.0.128.0/17"
    }
  }
}
}
