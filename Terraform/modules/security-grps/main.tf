# ALB security Group
resource "aws_security_group" "lb" {
    name        = var.lb_security_group_name
    description = var.lb_security_group_desc
    vpc_id      = var.vpc_id

    ingress {
        protocol    = "tcp"
        from_port   = var.http_port
        to_port     = var.http_port
        cidr_blocks = [var.internet_cidr_block]
    }

       ingress {
        protocol    = "tcp"
        from_port   = var.https_port
        to_port     = var.https_port
        cidr_blocks = [var.internet_cidr_block]
    }

    egress {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = [var.internet_cidr_block]
    }
}

# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_tasks" {
    name        = var.ecs_security_group_name
    description = var.ecs_security_group_desc
    vpc_id      = var.vpc_id

    ingress {
        protocol        = "tcp"
        from_port       = var.app_port
        to_port         = var.app_port
        security_groups = [aws_security_group.lb.id]
        
    }

    egress {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = [var.internet_cidr_block]
    }
}