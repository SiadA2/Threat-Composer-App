variable "fargate_cpu" {
  type    = string
  default = "1024"
}

variable "fargate_memory" {
  type    = string
  default = "2048"
}

variable "app_count" {
  default = 2
}

variable "launch_type" {
  type    = string
  default = "FARGATE"
}
variable "network_mode" {
  type    = string
  default = "awsvpc"
}

variable "cluster_name" {
  type    = string
  default = "cb-cluster"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecsTaskExecutionRole"
}

variable "task_family" {
  type    = string
  default = "cb-app-task"
}

variable "alb_target_grp_arn" {
}

variable "ecs_security_group_id" {
}

variable "private_subnet_id" {
}

variable "app_port" {
}