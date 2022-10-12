variable "ts_aws_ecs_service_cluster" {
  description = "TinyStacks AWS ECS Service Cluster"
  type        = string
}

variable "ts_aws_ecs_service_subnets" {
  description = "TinyStacks AWS ECS Service subnets"
  type        = list(string)
}

variable "ts_aws_ecs_service_security_groups" {
  description = "TinyStacks AWS ECS Service security groups"
  type        = list(string)
}

variable "ts_aws_ecs_service_load_balancer_target_group_arn" {
  description = "TinyStacks AWS ECS service load balancer target group arn"
  type        = string
}

variable "ts_aws_ecs_service_name" {
  description = "TinyStacks AWS ECS Service Name"
  type        = string
  default     = "acme-api"
}

variable "ts_aws_ecs_service_launch_type" {
  description = "TinyStacks AWS ECS Service launch type"
  type        = string
  default     = "FARGATE"
}

variable "ts_aws_ecs_task_definition_container_definitions" {
  description = "TinyStacks AWS ECS task definition container definitions"
  type        = string
  default     = <<EOF
  [
    {
      "name": "acme-api",
      "image": "ajjester/acme-api:latest",
      "portMappings": [
        {
          "containerPort": 3000
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-region": "us-east-1",
          "awslogs-group": "/ecs/acme-api",
          "awslogs-stream-prefix": "ecs"
        }
      }
    }
  ]
  EOF
}

variable "ts_aws_ecs_task_definition_cpu" {
  description = "TinyStacks AWS ECS task definition cpu"
  type        = number
  default     = 256
}

variable "ts_aws_ecs_task_definition_memory" {
  description = "TinyStacks AWS ECS task definition memory"
  type        = number
  default     = 512
}

variable "ts_aws_ecs_service_desired_count" {
  description = "TinyStacks AWS ECS service desired count"
  type        = number
  default     = 1
}

variable "ts_aws_ecs_task_definition_requires_compatibilities" {
  description = "TinyStacks AWS ECS task definition requires compatibilities"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "ts_aws_iam_role_ecs_task_execution_role_name" {
  description = "TinyStacks AWS IAM role ECS task execution role name"
  type        = string
  default     = "ecs-task-execution-role"
}

variable "ts_aws_ecs_service_load_balancer_container_port" {
  description = "TinyStacks AWS ECS service load balancer container port"
  type        = string
  default     = "3000"
}