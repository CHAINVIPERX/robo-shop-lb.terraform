data "aws_ssm_parameter" "web_lb_dns_name" {
  name = "/${var.project_name}/${var.environment}/web_lb_dns_name"
}

data "aws_ssm_parameter" "ladoo_certificate_arn" {
  name = "/${var.project_name}/${var.environment}/ladoo_certificate_arn"

}

data "aws_cloudfront_cache_policy" "cache" {
  name = "Managed-CachingOptimized"

}


data "aws_cloudfront_cache_policy" "no_cache" {
  name = "Managed-CachingDisabled"

}
