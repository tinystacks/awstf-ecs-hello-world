variable "hello_world_aws_region" {
  description = "Hello world AWS region"
  type        = string
  default     = "us-east-2"
}

/* */

variable "hello_world_aws_vpc_cidr_block" {
  description = "Hello World AWS VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "hello_world_aws_vpc_cidr_newbits" {
  description = "Hello World AWS VPC CIDR new bits"
  type        = number
  default     = 4
}

/* */

variable "hello_world_public_igw_cidr_blocks" {
  type = map(number)
  description = "Hello World Availability Zone CIDR Mapping for Public IGW subnets"
 
  default = {
    "us-east-2a" = 1
    "us-east-2b" = 2
    "us-east-2c" = 3
  }
}

/* */

variable "hello_world_private_ngw_cidr_blocks" {
  type = map(number)
  description = "Hello World Availability Zone CIDR Mapping for Private NGW subnets"
 
  default = {
    "us-east-2a" = 4
    "us-east-2b" = 5
    "us-east-2c" = 6
  }
}

/* */

variable "hello_world_private_isolated_cidr_blocks" {
  type = map(number)
  description = "Hello World Availability Zone CIDR Mapping for Private isolated subnets"
 
  default = {
    "us-east-2a" = 7
    "us-east-2b" = 8
    "us-east-2c" = 9
  }
}

/* */

variable "acme_aws_ecs_cluster_name" {
  description = "Acme AWS ECS Cluster Name"
  type        = string
  default     = "acme"
}

variable "acme_api_aws_ecs_service_name" {
  description = "Acme API AWS ECS Service Name"
  type        = string
  default     = "acme-api"
}

variable "acme_api_aws_ecs_container_name" {
  description = "Acme API AWS ECS Container Name"
  type        = string
  default     = "acme-api"
}

/* */

// We don't support List<Map> in the sdk yet; this parameter will remain defaulted and not exposed in the source
variable "acme_api_alb_aws_security_group_rules" {
  description = "Acme API ALB AWS Security Group rules"

  type = list(object({
    rule_type   = string
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      rule_type   = "ingress"
      description = "HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      rule_type   = "ingress"
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      rule_type   = "egress"
      description = "Outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

// If this is set to true, it's impossible to test; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_alb_internal" {
  description = "Acme API AWS ALB internal"
  type        = bool
  default     = false
}

// This won't work for any value other than the default; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_alb_load_balancer_type" {
  description = "Acme API AWS ALB load balancer type"
  type        = string
  default     = "application"
}

variable "acme_api_aws_lb_target_group_port" {
  description = "Acme API AWS LB target group port"
  type        = number
  default     = 8000
}

// This won't work for any value other than the default; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_lb_target_group_protocol" {
  description = "Acme API AWS LB target group protocol"
  type        = string
  default     = "HTTP"
}

// This won't work for any value other than the default; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_lb_target_group_target_type" {
  description = "Acme API AWS LB target group target type"
  type        = string
  default     = "ip"
}

variable "acme_api_aws_lb_target_group_health_check_enabled" {
  description = "Acme API AWS LB target group health check enabled"
  type        = bool
  default     = true
}

variable "acme_api_aws_lb_target_group_health_check_path" {
  description = "Acme API AWS LB target group health check path"
  type        = string
  default     = "/healthy"
}

// This won't work for any value other than the default; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_alb_listener_port" {
  description = "Acme API AWS ALB listener port"
  type        = string
  default     = "80"
}

// This won't work for any value other than the default; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_alb_listener_protocol" {
  description = "Acme API AWS ALB listener protocol"
  type        = string
  default     = "HTTP"
}

// This won't work for any value other than the default; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_alb_listener_default_action_type" {
  description = "Acme API AWS ALB listener default action type"
  type        = string
  default     = "forward"
}

/* */

// Our sdk doesn't support List<Map> so we have no way to ingest this;  for now it will be re-defined in main.tf using the port variable instead.
variable "acme_api_aws_security_group_rules" {
  description = "Acme API AWS Security Group rules"

  type = list(object({
    rule_type   = string
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [
    {
      rule_type   = "ingress"
      description = "acme-api"
      from_port   = 8000
      to_port     = 8000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      rule_type   = "egress"
      description = "Outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

// This won't work for any value other than the default; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_ecs_service_launch_type" {
  description = "Acme API AWS ECS Service launch type"
  type        = string
  default     = "FARGATE"
}

// We really only need to accept the image url; everything else here was already declared in other variables.
variable "image_url" {
  description = "Image Url for the Docker image to use"
  type        = string
  default     = "public.ecr.aws/tinystacks/aws-docker-templates-express:latest-x86"
}

variable "acme_api_aws_ecs_task_definition_cpu" {
  description = "Acme API AWS ECS task definition cpu"
  type        = number
  default     = 256
}

variable "acme_api_aws_ecs_task_definition_memory" {
  description = "Acme API AWS ECS task definition memory"
  type        = number
  default     = 512
}

// This won't work for any value other than the default; this parameter will remain defaulted and not exposed in the source
variable "acme_api_aws_ecs_task_definition_requires_compatibilities" {
  description = "Acme API AWS ECS task definition requires compatibilities"
  type        = list(string)
  default     = ["FARGATE"]
}

variable "acme_api_aws_ecs_service_desired_count" {
  description = "Acme API AWS ECS service desired count"
  type        = number
  default     = 1
}

variable "acme_api_aws_iam_role_ecs_task_execution_role_name" {
  description = "Acme API AWS IAM role ECS task execution role name"
  type        = string
  default     = "ecs-task-execution-role"
}

/* */
