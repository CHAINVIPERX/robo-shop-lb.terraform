data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"

}

data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project_name}/${var.environment}/user_sg_id"

}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"


}

data "aws_ssm_parameter" "app_lb_listener_arn" {
  name = "/${var.project_name}/${var.environment}/app_lb_listener_arn"
}


