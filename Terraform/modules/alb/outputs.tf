output "alb_target_grp" {
    description = "id of the alb target group"
    value  = aws_alb_target_group.app.arn
}

output "alb_dns_name" {
    description = "public dns name of the lb"
    value = aws_alb.main.dns_name
}

output "alb_zone_id" {
  description = "zone id of the alb"
  value = aws_alb.main.zone_id
}