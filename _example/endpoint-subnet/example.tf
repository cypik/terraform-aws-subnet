provider "aws" {
  region = local.region
}

locals {
  region = "us-west-1"
}

##-----------------------------------------------------------------------------
## Vpc Module call.
##-----------------------------------------------------------------------------
module "vpc" {
  source      = "cypik/vpc/aws"
  version     = "1.0.4"
  name        = "app"
  environment = "test"
  cidr_block  = "10.0.0.0/16"
}

##-----------------------------------------------------------------------------
## Subnet Module call.
##-----------------------------------------------------------------------------

module "endpoint-subnet" {
  source              = "./../../"
  name                = "app"
  environment         = "test"
  availability_zones  = ["us-west-1a", "us-west-1c"]
  vpc_id              = module.vpc.vpc_id
  type                = "public-private"
  vpc_endpoint_type   = "Gateway"
  service_name        = "com.amazonaws.${local.region}.s3"
  igw_id              = module.vpc.igw_id
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  enable_ipv6         = false
  nat_gateway_enabled = false
  endpoint_enabled    = true
}