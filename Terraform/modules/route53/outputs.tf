output "route53_hosted_zone" {
  value = data.aws_route53_zone.primary.id
}