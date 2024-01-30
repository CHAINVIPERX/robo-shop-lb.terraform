resource "aws_cloudfront_distribution" "ladoo_shop" {
  enabled = true
  aliases = ["web-${var.tags.component}.${var.zone_name}"]
  origin {
    domain_name = "web-${var.environment}.${var.zone_name}"
    origin_id   = "web-${var.environment}.${var.zone_name}"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }


  ordered_cache_behavior {
    path_pattern           = "/images/*"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "web-${var.environment}.${var.zone_name}"
    compress               = true
    viewer_protocol_policy = "https-only"
    cache_policy_id        = data.aws_cloudfront_cache_policy.cache.id
  }

  ordered_cache_behavior {
    path_pattern           = "/static/*"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "web-${var.environment}.${var.zone_name}"
    compress               = true
    viewer_protocol_policy = "https-only"
    cache_policy_id        = data.aws_cloudfront_cache_policy.cache.id
  }


  default_cache_behavior {
    allowed_methods        = ["POST", "HEAD", "PATCH", "DELETE", "PUT", "GET", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = "web-${var.environment}.${var.zone_name}"
    viewer_protocol_policy = "https-only"
    cache_policy_id        = data.aws_cloudfront_cache_policy.no_cache.id
  }


  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "IN", "CA"]
    }
  }

  tags = merge(var.common_tags, var.tags)
  viewer_certificate {
    acm_certificate_arn      = data.aws_ssm_parameter.ladoo_certificate_arn.value
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }
}


module "records" {
  source    = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name

  records = [
    {
      name = "web-${var.tags.component}"
      type = "A"
      alias = {
        name    = aws_cloudfront_distribution.ladoo_shop.domain_name
        zone_id = aws_cloudfront_distribution.ladoo_shop.hosted_zone_id
      }
    }
  ]
}

