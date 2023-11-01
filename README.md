# terraform-aws-subnet
# Terraform AWS VPC and Subnet Modules
## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [License](#license)


## Introduction
This Terraform code defines an AWS VPC and associated subnets using reusable modules. It creates a VPC with configurable parameters and then deploys subnets within that VPC.

## Usage
To use this module, include it in your Terraform configuration file and provide the required input variables. Below is an example of how to use the module:

# private-subnet

```hcl
module "private-subnets" {
  source              = "git::https://github.com/opz0/terraform-aws-subnet.git?ref=v1.0.0"
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
```

You can customize the input variables according to your specific requirements.

# public-private-subnet-single-nat-gateway

```hcl
module "subnets" {
  source              = "git::https://github.com/opz0/terraform-aws-subnet.git?ref=v1.0.0"
  nat_gateway_enabled = true
  single_nat_gateway  = true
  name                = "app"
  environment         = "test"
  availability_zones  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  vpc_id              = module.vpc.id
  type                = "public-private"
  igw_id              = module.vpc.igw_id
  cidr_block          = module.vpc.vpc_cidr_block
  ipv6_cidr_block     = module.vpc.ipv6_cidr_block
  enable_ipv6         = false
}
```
You can customize the input variables according to your specific requirements.

# public-private

```hcl
module "subnets" {
  source                                         = "git::https://github.com/opz0/terraform-aws-subnet.git?ref=v1.0.0"
  name                                           = "app"
  environment                                    = "test"
  nat_gateway_enabled                            = true
  availability_zones                             = ["eu-west-1a", "eu-west-1b"]
  vpc_id                                         = module.vpc.id
  type                                           = "public-private"
  igw_id                                         = module.vpc.igw_id
  cidr_block                                     = module.vpc.vpc_cidr_block
  ipv6_cidr_block                                = module.vpc.ipv6_cidr_block
  public_subnet_assign_ipv6_address_on_creation  = true
  enable_ipv6                                    = true
  private_subnet_assign_ipv6_address_on_creation = true
}
```
You can customize the input variables according to your specific requirements.

# public-subnet

```hcl
module "subnet" {
  source             = "git::https://github.com/opz0/terraform-aws-subnet.git?ref=v1.0.0"
  name               = "app"
  environment        = "test"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_id             = module.vpc.id
  type               = "public"
  igw_id             = module.vpc.igw_id
  ipv4_public_cidrs  = ["10.0.1.0/24", "10.0.13.0/24", "10.0.18.0/24"]
  enable_ipv6        = false
}
```
You can customize the input variables according to your specific requirements.

## Module Inputs
Here are the input variables you can configure for the VPC and subnet modules:

- 'source': The source path to the Subnet module. Update this with your - module's source path.
- 'name': A name to identify the VPC or subnet.
- 'environment': The environment (e.g., "test") for the VPC or subnet.
- 'cidr_block': The IPv4 CIDR block for the VPC or subnet.
- 'enable_flow_log': Set to `true` to enable flow logs.
- 'create_flow_log_cloudwatch_iam_role': Set to true to create the IAM role for CloudWatch Logs.
- 'additional_cidr_block': A list of additional IPv4 CIDR blocks to associate with the VPC.
- 'dhcp_options_domain_name': The domain name for DHCP options.
- 'dhcp_options_domain_name_servers': Domain name servers for DHCP options.
- 'assign_generated_ipv6_cidr_block': Set to true to assign generated IPv6 CIDR block.
- 'nat_gateway_enabled': Set to `true` to enable NAT gateways.
- 'single_nat_gateway': Set to `true` for a single NAT gateway per subnet, or `false`
- 'availability_zones': List of availability zones to create subnets in.
- 'vpc_id': The ID of the VPC associated with the subnet.
- 'type': The type of subnet (e.g., "private" or "public").
- 'ipv6_cidr_block': The IPv6 CIDR block for the subnet.
- 'ipv4_private_cidrs': Additional IPv4 CIDR blocks for the subnet.
- 'public_subnet_ids': List of public subnet IDs if this is a private subnet.
- 'igw_id': The ID of the Internet Gateway associated with the VPC.
- 'enable_ipv6': Set to `true` to enable IPv6.
- 'public_subnet_assign_ipv6_address_on_creation': Set to true to assign IPv6 addresses to public subnets.
- 'private_subnet_assign_ipv6_address_on_creation': Set to true to assign IPv6 addresses to private subnets.
Please make sure to configure these variables according to your requirements.

## Module Outputs
The module provides useful outputs that you can use in your Terraform configurations:

- 'id': The ID of the VPC.
- 'igw_id': The ID of the Internet Gateway.
- 'vpc_cidr_block': The CIDR block of the VPC.
- 'ipv6_cidr_block': The IPv6 CIDR block of the VPC.
- 'module.vpc.id': The ID of the VPC created.
- 'module.vpc.igw_id': The ID of the Internet Gateway created.
- 'module.vpc.vpc_cidr_block': The CIDR block of the VPC.
- 'module.vpc.ipv6_cidr_block': The IPv6 CIDR block of the VPC.

Additional outputs may be available depending on the specific module version. Refer to the module documentation for details.

## Examples
For detailed examples on how to use this module, please refer to the 'examples' directory within this repository.

## Author
Your Name Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/opz0/terraform-aws-subnet/blob/readme/LICENSE) file for details.
