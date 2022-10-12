variable "ts_aws_lb_target_group_vpc_id" {
  description = "TinyStacks AWS LB target group VPC id"
  type        = string
}

variable "ts_aws_alb_subnets" {
  description = "TinyStacks AWS ALB subnets"
  type        = list(string)
}

variable "ts_aws_alb_security_groups" {
  description = "TinyStacks AWS ALB security groups"
  type        = list(string)
}

variable "ts_aws_alb_name" {
  description = "TinyStacks AWS ALB name"
  type        = string
  default     = "acme-api"
}

variable "ts_aws_alb_internal" {
  description = "TinyStacks AWS ALB internal"
  type        = bool
  default     = false
}

variable "ts_aws_alb_load_balancer_type" {
  description = "TinyStacks AWS ALB load balancer type"
  type        = string
  default     = "application"
}

variable "ts_aws_lb_target_group_port" {
  description = "TinyStacks AWS LB target group port"
  type        = number
  default     = 3000
}

variable "ts_aws_lb_target_group_protocol" {
  description = "TinyStacks AWS LB target group protocol"
  type        = string
  default     = "HTTP"
}

variable "ts_aws_lb_target_group_target_type" {
  description = "TinyStacks AWS LB target group target type"
  type        = string
  default     = "ip"
}

variable "ts_aws_lb_target_group_health_check_enabled" {
  description = "TinyStacks AWS LB target group health check enabled"
  type        = bool
  default     = true
}

variable "ts_aws_lb_target_group_health_check_path" {
  description = "TinyStacks AWS LB target group health check path"
  type        = string
  default     = "/health"
}

variable "ts_aws_alb_listener_port" {
  description = "TinyStacks AWS ALB listener port"
  type        = string
  default     = "80"
}

variable "ts_aws_alb_listener_protocol" {
  description = "TinyStacks AWS ALB listener protocol"
  type        = string
  default     = "HTTP"
}

variable "ts_aws_alb_listener_default_action_type" {
  description = "TinyStacks AWS ALB listener default action type"
  type        = string
  default     = "forward"
}