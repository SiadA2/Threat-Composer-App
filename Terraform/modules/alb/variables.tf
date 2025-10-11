variable "health_check_path" {
  default = "/"
}

variable "app_port" {
    description = "Port exposed by the docker image to redirect traffic to"
    default = 3000

}

variable "vpc_id" {
}

variable "security_groups" {
}

variable "subnets" {
}

