output "hello_world_aws_vpc_id" {
  description = "Hello World AWS VPC ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
}

output "hello_world_aws_subnet_public_igw_map" {
  description = "Hello World AWS Subnet Public IGW ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_subnet_public_igw_map
}

output "hello_world_aws_subnet_private_ngw_map" {
  description = "Hello World AWS Subnet Private NGW ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_subnet_private_ngw_map
}

output "hello_world_aws_subnet_private_isolated_map" {
  description = "Hello World AWS Subnet Private isolated ID"
  value       = module.ts_aws_vpc_hello_world.ts_aws_subnet_private_isolated_map
}


output "acme_api_aws_alb_url" {
  description = "TinyStacks AWS ALB URL"
  value = "http://${module.acme_api_aws_alb.ts_aws_alb_dns_name}"
}
