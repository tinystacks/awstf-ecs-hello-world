output "ts_aws_security_group_id" {
  description = "TinyStacks AWS Security Group ID"
  value       = aws_security_group.ts_aws_security_group.id
}