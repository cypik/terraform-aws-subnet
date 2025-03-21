# Public Subnet Outputs
output "public_subnet_cidrs" {
  value       = module.subnet.public_subnet_cidrs
  description = "The CIDR of the public subnet."
}

output "public_subnet_cidrs_ipv6" {
  value       = module.subnet.public_subnet_cidrs_ipv6
  description = "The IPv6 CIDR of the public subnet."
}

output "public_tags" {
  value       = module.subnet.public_tags
  description = "A mapping of tags assigned to the public subnet."
}

output "public_subnet_id" {
  value       = module.subnet.public_subnet_id
  description = "The ID of the public subnet."
}

# Database Subnet Outputs
output "database_subnet_cidrs" {
  value       = module.subnet.database_subnet_cidrs
  description = "The CIDR of the database subnet."
}

output "database_subnet_cidrs_ipv6" {
  value       = module.subnet.database_subnet_cidrs_ipv6
  description = "The IPv6 CIDR of the database subnet."
}

output "database_tags" {
  value       = module.subnet.database_tags
  description = "A mapping of tags assigned to the database subnet."
}

output "database_subnet_id" {
  value       = module.subnet.database_subnet_id
  description = "The ID of the database subnet."
}

output "database_subnet_arn" {
  value       = module.subnet.database_subnet_arn
  description = "The ARN of the database subnet."
}

output "database_subnet_owner_id" {
  value       = module.subnet.database_subnet_owner_id
  description = "The owner ID of the database subnet."
}
