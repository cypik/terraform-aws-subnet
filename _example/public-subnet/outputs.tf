output "public_subnet_cidrs" {
  value       = module.subnet.public_subnet_cidrs
  description = "The CIDR of the subnet."
}

output "public_subnet_cidrs_ipv6" {
  value       = module.subnet.public_subnet_cidrs_ipv6
  description = "The CIDR of the subnet."
}

output "public_tags" {
  value       = module.subnet.public_tags
  description = "A mapping of tags to assign to the resource."
}

output "public_subnet_id" {
  value       = module.subnet.public_subnet_id
  description = "The ID of the public subnet"
}

output "public_subnet_arn" {
  value = module.subnet.public_subnet_arn
}

output "public_subnet_tags_all" {
  value = module.subnet.public_subnet_tags_all
}

output "public_subnet_owner_id" {
  value = module.subnet.public_subnet_owner_id
}