terraform {
  required_version = ">= 1.0" 
  # backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
  }
}

provider "aws" {
  region  = var.hello_world_aws_region
}

module "ts_aws_vpc_hello_world" {
  # source = "../vpc"
  source = "git::https://github.com/tinystacks/tinystacks-terraform-modules.git//aws/modules/vpc?ref=0.1.0"

  ts_aws_vpc_cidr_block   = var.hello_world_aws_vpc_cidr_block
  ts_aws_vpc_cidr_newbits = var.hello_world_aws_vpc_cidr_newbits

  ts_public_igw_cidr_blocks       = var.hello_world_public_igw_cidr_blocks
  ts_private_ngw_cidr_blocks      = var.hello_world_private_ngw_cidr_blocks
  ts_private_isolated_cidr_blocks = var.hello_world_private_isolated_cidr_blocks

}

/* FARGATE */

resource "aws_ecs_cluster" "acme_aws_ecs_cluster" {
  name = var.acme_aws_ecs_cluster_name

}

module "acme_api_alb_aws_security_group" {
  # source = "../security_group"
  source = "git::https://github.com/tinystacks/tinystacks-terraform-modules.git//aws/modules/security_group?ref=0.1.0"

  ts_aws_security_group_vpc_id = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
  ts_aws_security_group_rules  = var.acme_api_alb_aws_security_group_rules

}

module "acme_api_aws_alb" {
  # source = "../alb"
  source = "git::https://github.com/tinystacks/tinystacks-terraform-modules.git//aws/modules/alb?ref=0.1.0"

  ts_aws_lb_target_group_vpc_id = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
  ts_aws_alb_subnets            = values(module.ts_aws_vpc_hello_world.ts_aws_subnet_public_igw_map)
  ts_aws_alb_security_groups    = [module.acme_api_alb_aws_security_group.ts_aws_security_group_id]

  ts_aws_alb_name                             = var.acme_api_aws_ecs_service_name
  ts_aws_alb_internal                         = var.acme_api_aws_alb_internal
  ts_aws_alb_load_balancer_type               = var.acme_api_aws_alb_load_balancer_type
  ts_aws_lb_target_group_port                 = var.acme_api_aws_lb_target_group_port
  ts_aws_lb_target_group_protocol             = var.acme_api_aws_lb_target_group_protocol
  ts_aws_lb_target_group_target_type          = var.acme_api_aws_lb_target_group_target_type
  ts_aws_lb_target_group_health_check_enabled = var.acme_api_aws_lb_target_group_health_check_enabled
  ts_aws_lb_target_group_health_check_path    = var.acme_api_aws_lb_target_group_health_check_path
  ts_aws_alb_listener_port                    = var.acme_api_aws_alb_listener_port
  ts_aws_alb_listener_protocol                = var.acme_api_aws_alb_listener_protocol
  ts_aws_alb_listener_default_action_type     = var.acme_api_aws_alb_listener_default_action_type

}

module "acme_api_aws_security_group" {
  # source = "../security_group"
  source = "git::https://github.com/tinystacks/tinystacks-terraform-modules.git//aws/modules/security_group?ref=0.1.0"

  ts_aws_security_group_vpc_id = module.ts_aws_vpc_hello_world.ts_aws_vpc_id
  ts_aws_security_group_rules  = var.acme_api_aws_security_group_rules

}

module "acme_api_aws_ecs_service" {
  # source = "../ecs_service"
  source = "git::https://github.com/tinystacks/tinystacks-terraform-modules.git//aws/modules/ecs_service?ref=0.1.0"

  ts_aws_ecs_service_cluster                        = aws_ecs_cluster.acme_aws_ecs_cluster.id
  ts_aws_ecs_service_subnets                        = values(module.ts_aws_vpc_hello_world.ts_aws_subnet_private_ngw_map)
  ts_aws_ecs_service_security_groups                = [module.acme_api_aws_security_group.ts_aws_security_group_id]
  ts_aws_ecs_service_load_balancer_target_group_arn = module.acme_api_aws_alb.ts_aws_lb_target_group_arn

  ts_aws_ecs_service_name                             = var.acme_api_aws_ecs_service_name
  ts_aws_ecs_service_launch_type                      = var.acme_api_aws_ecs_service_launch_type
  ts_aws_ecs_task_definition_container_definitions    = var.acme_api_aws_ecs_task_definition_container_definitions
  ts_aws_ecs_task_definition_cpu                      = var.acme_api_aws_ecs_task_definition_cpu
  ts_aws_ecs_task_definition_memory                   = var.acme_api_aws_ecs_task_definition_memory
  ts_aws_ecs_task_definition_requires_compatibilities = var.acme_api_aws_ecs_task_definition_requires_compatibilities
  ts_aws_ecs_service_desired_count                    = var.acme_api_aws_ecs_service_desired_count
  ts_aws_iam_role_ecs_task_execution_role_name        = var.acme_api_aws_iam_role_ecs_task_execution_role_name
  ts_aws_ecs_service_load_balancer_container_port     = var.acme_api_aws_lb_target_group_port

}
