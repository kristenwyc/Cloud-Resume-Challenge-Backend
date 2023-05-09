resource "aws_s3_bucket" "s3_bucket" {
  bucket = "kristenwyc"
}

resource "aws_cloudfront_distribution" "s3_distribution-kristenwyc" {
  aliases = [
    "kristenwyc.com",
    "www.kristenwyc.com"
  ]
  origin {
    domain_name              = var.origin_id
    origin_access_control_id = var.origin_access_control_id
    origin_id                = var.origin_id
  }
  default_cache_behavior {
    cache_policy_id = var.default_cache_behavior_cache_policy_id
    allowed_methods = [
      "HEAD",
      "GET"
    ]
    cached_methods = [
      "GET",
      "HEAD",
    ]
    compress               = true
    smooth_streaming       = false
    target_origin_id       = var.origin_id
    viewer_protocol_policy = "redirect-to-https"
  }
  ordered_cache_behavior {
    allowed_methods = [
      "HEAD",
      "GET"
    ]
    cached_methods = [
      "GET",
      "HEAD",
    ]
    cache_policy_id        = var.ordered_cache_behavior_cache_policy_id
    compress               = true
    default_ttl            = 0
    max_ttl                = 0
    min_ttl                = 0
    path_pattern           = "*"
    smooth_streaming       = false
    target_origin_id       = var.origin_id
    trusted_key_groups     = []
    viewer_protocol_policy = "redirect-to-https"
  }
  custom_error_response {
    error_caching_min_ttl = 10
    error_code            = 404
    response_code         = "200"
    response_page_path    = "/index2.html"
  }
  comment     = ""
  price_class = "PriceClass_All"
  enabled     = true
  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  http_version        = "http2"
  is_ipv6_enabled     = true
  default_root_object = "index2.html"
}
