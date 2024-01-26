resource "aws_acm_certificate" "ladoo_certificate" {
  domain_name       = "*.ladoo.shop"
  validation_method = "DNS"

  tags = merge(
    var.tags,
    var.common_tags
  )
  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_route53_record" "ladoo_certificate" {

  for_each = {
    for dvo in aws_acm_certificate.ladoo_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = data.aws_route53_zone.ladoo_zone.zone_id
}

resource "aws_acm_certificate_validation" "ladoo_certificate" {
  certificate_arn         = aws_acm_certificate.ladoo_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.ladoo_certificate : record.fqdn]
}
