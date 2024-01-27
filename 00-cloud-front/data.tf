data "aws_ssm_parameter" "web_lb_dns_name" {
  name = "/${var.project_name}/${var.environment}/web_lb_dns_name"
}

data "aws_ssm_parameter" "ladoo_certificate_arn" {
  name = "/${var.project_name}/${var.environment}/ladoo_certificate_arn"

}
