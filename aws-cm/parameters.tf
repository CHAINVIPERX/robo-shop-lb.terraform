resource "aws_ssm_parameter" "ladoo_certificate_arn" {
  name  = "/${var.project_name}/${var.environment}/ladoo_certificate_arn"
  type  = "String"
  value = aws_acm_certificate.ladoo_certificate.arn

}
