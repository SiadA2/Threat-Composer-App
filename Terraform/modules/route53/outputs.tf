output "route53_hosted_zone" {
  description = "the ID of the Route 53 hosted zone"
  value = aws_route53_zone.primary.id
}