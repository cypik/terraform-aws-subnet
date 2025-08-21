output "private_subnet_cidrs" {
  value       = module.endpoint-subnet.private_subnet_cidrs
  description = "The ID of the subnet."
}

output "private_tags" {
  value       = module.endpoint-subnet.private_tags
  description = "A mapping of tags to assign to the resource."
}

output "private_subnet_id" {
  value       = module.endpoint-subnet.private_subnet_id
  description = "The ID of the private subnet"
}

output "private_subnet_arn" {
  value       = module.endpoint-subnet.private_subnet_arn
  description = "The ARN of the private subnet"
}

output "private_subnet_tags_all" {
  value       = module.endpoint-subnet.private_subnet_tags_all
  description = "A map of tags assigned to the private subnet, including those inherited from the provider default_tags configuration block"
}

output "private_subnet_owner_id" {
  value       = module.endpoint-subnet.private_subnet_owner_id
  description = "The ID of the AWS account that owns the private subnet"
}

output "s3_service_name" {
  value       = "com.amazonaws.${local.region}.s3"
  description = "The AWS service name for S3 in the current region"
}

output "vpc_endpoint_id" {
  value       = module.endpoint-subnet.vpc_endpoint_ids
  description = "The ID of the VPC endpoint"
}

output "vpc_endpoint_arn" {
  value       = module.endpoint-subnet.vpc_endpoint_arns
  description = "The ARN of the VPC endpoint"
}

output "vpc_endpoint_cidr_blocks" {
  value       = module.endpoint-subnet.vpc_endpoint_cidr_blocks
  description = "The list of CIDR blocks for the exposed AWS service (Gateway type only)"
}

output "vpc_endpoint_dns_entries" {
  value = module.endpoint-subnet.vpc_endpoint_dns_entries

  description = "The DNS entries for the VPC Endpoint (Interface type only)"
}

output "vpc_endpoint_network_interface_ids" {
  value       = module.endpoint-subnet.vpc_endpoint_network_interface_ids
  description = "The network interfaces for the VPC Endpoint (Interface type only)"
}

output "vpc_endpoint_owner_id" {
  value       = module.endpoint-subnet.vpc_endpoint_owner_ids
  description = "The ID of the AWS account that owns the VPC endpoint"
}

output "vpc_endpoint_prefix_list_id" {
  value       = module.endpoint-subnet.vpc_endpoint_prefix_list_ids
  description = "The prefix list ID of the exposed AWS service (Gateway type only)"
}

output "vpc_endpoint_requester_managed" {
  value       = module.endpoint-subnet.vpc_endpoint_requester_managed
  description = "Whether the VPC Endpoint is managed by its service"
}

output "vpc_endpoint_state" {
  value       = module.endpoint-subnet.vpc_endpoint_states
  description = "The state of the VPC endpoint"
}