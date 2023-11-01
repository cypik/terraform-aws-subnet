provider "aws" {
  region = "eu-west-1"
}

##-----------------------------------------------------------------------------
## Vpc Module call.
##-----------------------------------------------------------------------------
module "vpc" {
  source      = "git::https://github.com/opz0/terraform-aws-vpc.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  cidr_block  = "10.0.0.0/16"

}

##-----------------------------------------------------------------------------
## Subnet Module call.
##-----------------------------------------------------------------------------
module "private-subnets" {
  source              = "./../../"
  name                = "app"
  environment         = "test"
  nat_gateway_enabled = true
  availability_zones  = ["eu-west-1a"]
  vpc_id              = module.vpc.id
  type                = "private"
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  ipv4_private_cidrs  = ["10.0.3.0/24"]
  public_subnet_ids   = ["subnet-07962e9e61ad3bcd3"]
}
