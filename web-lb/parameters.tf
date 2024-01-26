resource "aws_ssm_parameter" "web_lb_listener_arn" {

  name  = "/${var.project_name}/${var.environment}/web_lb_listener_arn"
  value = aws_lb_listener.https.arn
  type  = "String"

}
