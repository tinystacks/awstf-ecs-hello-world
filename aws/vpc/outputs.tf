output "ts_aws_vpc_id" {
  description = "TinyStacks AWS VPC ID"
  value       = aws_vpc.ts_aws_vpc.id
}

output "ts_aws_subnet_public_igw_map" {
  description = "TinyStacks AWS Subnet Public IGW ID and block"
  value = {
    for subnet in aws_subnet.ts_aws_subnet_public_igw :
    subnet.availability_zone => subnet.id
  }
}

output "ts_aws_subnet_private_ngw_map" {
  description = "TinyStacks AWS Subnet Private NGW ID and block"
  value = {
    for subnet in aws_subnet.ts_aws_subnet_private_ngw :
    subnet.availability_zone => subnet.id
  }
}

output "ts_aws_subnet_private_isolated_map" {
  description = "TinyStacks AWS Subnet Private isolated ID and block"
  value = {
    for subnet in aws_subnet.ts_aws_subnet_private_isolated :
    subnet.availability_zone => subnet.id
  }
}