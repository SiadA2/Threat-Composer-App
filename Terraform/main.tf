module "vpc" {
    source = "./modules/vpc"
}

module "alb" {
    source = "./modules/alb"
    vpc_id = module.vpc.vpc_id
    security_groups = module.security-grps.alb_security_group
    subnets = module.vpc.public_subnets
}

module "security-grps"{
    source = "./modules/security-grps"
    vpc_id = module.vpc.vpc_id

}

module "ecs" {
    source = "./modules/ecs"
    alb_target_grp_arn = module.alb.alb_target_grp
    ecs_security_group_id = module.security-grps.ecs_security_group
    private_subnet_id = module.vpc.private_subnets
}

module "route53" {
    source = "./modules/route53"
    alb_dns_name = module.alb.alb_dns_name
    alb_zone_id = module.alb.alb_zone_id
}

# module "acm" {
#     source = "./modules/acm"
# }