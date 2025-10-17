output "vpc_id" {
    description = "The value of our VPC id"
    value = aws_vpc.main.id
}

output "public_subnets" {
    description = "The ID of all public subnets"
    value = aws_subnet.public.*.id
}

output "private_subnets" {
    description = "The ID of all private subnets"
    value = aws_subnet.private.*.id
}