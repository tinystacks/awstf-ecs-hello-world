output "ts_aws_lb_target_group_arn" {
  description = "TinyStacks AWS LB target group ARN"
  value = aws_lb_target_group.ts_aws_lb_target_group.arn
}

output "ts_aws_alb_dns_name" {
  description = "TinyStacks AWS ALB DNS name"
  value = aws_alb.ts_aws_alb.dns_name
}