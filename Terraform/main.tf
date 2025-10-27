module "vpc" {
  source = "./modules/vpc"
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  security_groups   = module.security-grps.alb_security_group
  public_subnets_id = module.vpc.public_subnets_id
  certificate_arn   = module.acm.certificate_arn
  http_port         = var.http_port
  https_port        = var.https_port
  app_port          = var.app_port
}

module "security-grps" {
  source     = "./modules/security-grps"
  vpc_id     = module.vpc.vpc_id
  http_port  = var.http_port
  https_port = var.https_port
  app_port   = var.app_port

}

module "ecs" {
  source                = "./modules/ecs"
  alb_target_grp_arn    = module.alb.alb_target_grp
  ecs_security_group_id = module.security-grps.ecs_security_group
  app_port              = var.app_port
  public_subnets_id     = module.vpc.public_subnets_id
}

module "route53" {
  source       = "./modules/route53"
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
  domain_name  = var.domain_name
}

module "acm" {
  source         = "./modules/acm"
  hosted_zone_id = module.route53.route53_hosted_zone
  domain_name    = var.domain_name
}

