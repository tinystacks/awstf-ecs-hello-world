variable "hello_world_aws_region" {
  description = "Hello world AWS region"
  type        = string
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
    "us-east-1b" = 1
    "us-east-1d" = 2
    "us-east-1f" = 3
  }
}

/* */

variable "hello_world_private_ngw_cidr_blocks" {
  type = map(number)
  description = "Hello World Availability Zone CIDR Mapping for Private NGW subnets"
 
  default = {
    "us-east-1b" = 4
    "us-east-1d" = 5
    "us-east-1f" = 6
  }
}

/* */

variable "hello_world_private_isolated_cidr_blocks" {
  type = map(number)
  description = "Hello World Availability Zone CIDR Mapping for Private isolated subnets"
 
  default = {
    "us-east-1b" = 7
    "us-east-1d" = 8
    "us-east-1f" = 9
  }
}

/* */

variable "hello_world_vpc_security_group_rules" {
  description = "Hello World VPC Security Group rules"

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
      description = "Ping"
      from_port   = 0
      to_port     = 0
      protocol    = "ICMP"
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

/* */

variable "hello_world_aws_ami_filter_name_values" {
  description = "Hello World AWS AMI filter name:values"
  type        = list(string)
  default     = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"] 
}

variable "hello_world_aws_ami_owners" {
  description = "Hello World AWS AMI owners"
  type        = list(string)
  default     = ["099720109477"] 
}

variable "hello_world_aws_instance_type" {
  description = "Hello World AWS Instance type"
  type        = string
  default     = "t2.micro"
}

variable "hello_world_aws_instance_key_name" {
  description = "Hello World AWS Instance Key Name"
  type        = string
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

/* */

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

variable "acme_api_aws_alb_internal" {
  description = "Acme API AWS ALB internal"
  type        = bool
  default     = false
}

variable "acme_api_aws_alb_load_balancer_type" {
  description = "Acme API AWS ALB load balancer type"
  type        = string
  default     = "application"
}

variable "acme_api_aws_lb_target_group_port" {
  description = "Acme API AWS LB target group port"
  type        = number
  default     = 3000
}

variable "acme_api_aws_lb_target_group_protocol" {
  description = "Acme API AWS LB target group protocol"
  type        = string
  default     = "HTTP"
}

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
  default     = "/health"
}

variable "acme_api_aws_alb_listener_port" {
  description = "Acme API AWS ALB listener port"
  type        = string
  default     = "80"
}

variable "acme_api_aws_alb_listener_protocol" {
  description = "Acme API AWS ALB listener protocol"
  type        = string
  default     = "HTTP"
}

variable "acme_api_aws_alb_listener_default_action_type" {
  description = "Acme API AWS ALB listener default action type"
  type        = string
  default     = "forward"
}

/* */

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
      from_port   = 3000
      to_port     = 3000
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

variable "acme_api_aws_ecs_service_launch_type" {
  description = "Acme API AWS ECS Service launch type"
  type        = string
  default     = "FARGATE"
}

variable "acme_api_aws_ecs_task_definition_container_definitions" {
  description = "Acme API AWS ECS task definition container definitions"
  type        = string
  default     = <<EOF
[{
"name": "hello-world-express",
"image": "public.ecr.aws/tinystacks/aws-docker-templates-express:latest-x86",
"portMappings": [{
	"containerPort": 3000
}],
"logConfiguration": {
	"logDriver": "awslogs",
	"options": {
		"awslogs-region": "us-east-1",
		"awslogs-group": "/ecs/hello_world",
		"awslogs-stream-prefix": "ecs"
	}
}
}]
  EOF
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
