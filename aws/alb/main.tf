resource "aws_alb" "ts_aws_alb" {

  name               = var.ts_aws_alb_name
  internal           = var.ts_aws_alb_internal
  load_balancer_type = var.ts_aws_alb_load_balancer_type
  subnets            = var.ts_aws_alb_subnets
  security_groups    = var.ts_aws_alb_security_groups

}

resource "aws_lb_target_group" "ts_aws_lb_target_group" {
  name        = aws_alb.ts_aws_alb.name
  vpc_id      = var.ts_aws_lb_target_group_vpc_id
  port        = var.ts_aws_lb_target_group_port
  protocol    = var.ts_aws_lb_target_group_protocol
  target_type = var.ts_aws_lb_target_group_target_type

  health_check {
    enabled = var.ts_aws_lb_target_group_health_check_enabled
    path    = var.ts_aws_lb_target_group_health_check_path
  }

}

resource "aws_alb_listener" "ts_aws_alb_listener" {
  load_balancer_arn = aws_alb.ts_aws_alb.arn
  port              = var.ts_aws_alb_listener_port
  protocol          = var.ts_aws_alb_listener_protocol

  default_action {
    type             = var.ts_aws_alb_listener_default_action_type
    target_group_arn = aws_lb_target_group.ts_aws_lb_target_group.arn
  }
}