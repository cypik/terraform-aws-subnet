provider "aws" {
  region = "us-east-1"
}

##-----------------------------------------------------------------------------
## Vpc Module call.
##-----------------------------------------------------------------------------
module "vpc" {
  source      = "cypik/vpc/aws"
  version     = "1.0.1"
  name        = "app"
  environment = "test"
  cidr_block  = "10.0.0.0/16"

}

##-----------------------------------------------------------------------------
## Subnet Module call.
##-----------------------------------------------------------------------------
module "subnets" {
  source              = "./../../"
  name                = "app"
  environment         = "test"
  nat_gateway_enabled = true
  single_nat_gateway  = true
  availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_id              = module.vpc.id
  type                = "public-private"
  igw_id              = module.vpc.igw_id
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  enable_ipv6         = true
}
