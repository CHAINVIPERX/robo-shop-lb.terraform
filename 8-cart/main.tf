module "cart" {
  source               = "../APP-MODULE"
  vpc_id               = var.vpc_id
  component_sg_id      = var.cart_sg_id
  private_subnet_ids   = local.private_subnet_ids
  iam_instance_profile = "instance_creation_shell"
  app_lb_listener_arn  = var.app_lb_listener_arn
  project_name         = var.project_name
  environment          = var.environment
  common_tags          = var.common_tags
  tags                 = var.tags
  zone_name            = var.zone_name
  priority_rule        = 30
}
