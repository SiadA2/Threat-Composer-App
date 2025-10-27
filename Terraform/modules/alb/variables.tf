variable "health_check_path" {
  default = "/"
}

variable "protocol" {
  type    = string
  default = "HTTP"
}

variable "target_group_name" {
  type    = string
  default = "tm-target-group"
}

variable "forward_action" {
  type    = string
  default = "forward"
}

variable "alb_name" {
  type    = string
  default = "tm-load-balancer"
}

variable "target_type" {
  type    = string
  default = "ip"
}

variable "vpc_id" {
}

variable "security_groups" {
}

variable "public_subnets_id" {
}

variable "certificate_arn" {
}

variable "app_port" {
}

variable "http_port" {
}

variable "https_port" {
}