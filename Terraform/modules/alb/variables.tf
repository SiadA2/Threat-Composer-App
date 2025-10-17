variable "health_check_path" {
  default = "/"
}

variable "app_port" {
    description = "Port exposed by the docker image to redirect traffic to"
    default = 3000

}

variable "protocol" {
  type = string
  default = "HTTP"
}

variable "http_port" {
    type = number
    default = 80
}

variable "https_port" {
    type = number
    default = 443
}

variable "target_group_name" {
  type = string
  default = "tm-target-group"
}

variable "forward_action" {
  type = string
  default = "forward"
}

variable "alb_name" {
  type = string
  default = "tm-load-balancer"
}

variable "target_type" {
  type = string 
  default = "ip"
}

variable "vpc_id" {
}

variable "security_groups" {
}

variable "subnets" {
}

variable "certificate_arn"{
}
