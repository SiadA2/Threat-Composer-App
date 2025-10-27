output "vpc_id" {
  description = "The value of our VPC id"
  value       = aws_vpc.main.id
}

output "public_subnets_id" {
  description = "The ID of all public subnets"
  value       = aws_subnet.public.*.id
}

