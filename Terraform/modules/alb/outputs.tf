output "alb_target_grp" {
  value = aws_alb_target_group.app.arn
}

output "alb_dns_name" {
  value = aws_alb.main.dns_name
}

output "alb_zone_id" {
  value = aws_alb.main.zone_id
}