output "alb_security_group" {
    description = "The ID of the alb security group"
    value = aws_security_group.lb.id
}

output "ecs_security_group" {
    description = "the id of the ecs security group"
    value = aws_security_group.ecs_tasks.id
}