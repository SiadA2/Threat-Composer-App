variable "lb_security_group_name" {
  type    = string
  default = "cb-load-balancer-security-group"
}

variable "lb_security_group_desc" {
  type    = string
  default = "controls access to the ALB"
}

variable "ecs_security_group_name" {
  type    = string
  default = "cb-ecs-tasks-security-group"
}

variable "ecs_security_group_desc" {
  type    = string
  default = "allow inbound access from the ALB only"
}

variable "internet_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}

variable "http_port" {
}

variable "https_port" {
}

variable "vpc_id" {
}

variable "app_port" {
}
