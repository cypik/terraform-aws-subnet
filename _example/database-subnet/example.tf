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

module "subnet" {
  source             = "./../../"
  name               = "app"
  environment        = "test"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_id             = module.vpc.id
  cidr_block         = module.vpc.vpc_cidr_block
  type               = "database"
  enable_ipv6        = true
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}
