resource "aws_route53_zone" "primary" {
  name = var.domain_name
}


resource "aws_route53_record" "tm" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}
