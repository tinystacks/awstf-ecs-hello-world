resource "aws_cloudwatch_log_group" "ts_aws_cloudwatch_log_group" {
  name = "/ecs/${var.ts_aws_ecs_service_name}"
}

data "aws_iam_policy_document" "ts_aws_iam_policy_document_ecs_task_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ts_aws_iam_role_ecs_task_execution_role" {
  name               = var.ts_aws_iam_role_ecs_task_execution_role_name
  assume_role_policy = data.aws_iam_policy_document.ts_aws_iam_policy_document_ecs_task_assume_role.json
}

data "aws_iam_policy" "ts_aws_iam_policy_ecs_task_execution_role" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ts_aws_iam_role_ecs_task_execution_role.name
  policy_arn = data.aws_iam_policy.ts_aws_iam_policy_ecs_task_execution_role.arn
}

resource "aws_ecs_task_definition" "ts_aws_ecs_task_definition" {

  family                   = var.ts_aws_ecs_service_name
  container_definitions    = var.ts_aws_ecs_task_definition_container_definitions
  cpu                      = var.ts_aws_ecs_task_definition_cpu
  memory                   = var.ts_aws_ecs_task_definition_memory
  requires_compatibilities = var.ts_aws_ecs_task_definition_requires_compatibilities
  execution_role_arn       = aws_iam_role.ts_aws_iam_role_ecs_task_execution_role.arn

  network_mode = "awsvpc"
}

resource "aws_ecs_service" "ts_aws_ecs_service" {

  name               = var.ts_aws_ecs_service_name
  task_definition    = aws_ecs_task_definition.ts_aws_ecs_task_definition.arn
  launch_type        = var.ts_aws_ecs_service_launch_type
  cluster            = var.ts_aws_ecs_service_cluster
  desired_count      = var.ts_aws_ecs_service_desired_count

  network_configuration {
    subnets         = var.ts_aws_ecs_service_subnets
    security_groups = var.ts_aws_ecs_service_security_groups
  }

  load_balancer {
    target_group_arn = var.ts_aws_ecs_service_load_balancer_target_group_arn
    container_name   = var.ts_aws_ecs_service_name
    container_port   = var.ts_aws_ecs_service_load_balancer_container_port
  }

} 
