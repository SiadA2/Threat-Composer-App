variable "fargate_cpu" {
    description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
    default = "1024"
}

variable "fargate_memory" {
    description = "Fargate instance memory to provision (in MiB)"
    default = "2048"
}

variable "app_count" {
    description = "Number of docker containers to run"
    default = 2
}

variable "app_port" {
    description = "Port exposed by the docker image to redirect traffic to"
    default = 3000

}

variable "ecs_task_execution_role_name" {
    description = "ECS task execution role name"
    default = "ecsTaskExecutionRole"
}

variable "alb_target_grp_arn" {
}

variable "ecs_security_group_id" {
}

variable "private_subnet_id" {
}