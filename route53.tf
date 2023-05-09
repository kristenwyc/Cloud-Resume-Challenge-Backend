resource "aws_route53_record" "route53record-1" {
  name = var.domain_name
  type = "A"
  alias {
    name                   = aws_cloudfront_distribution.s3_distribution-kristenwyc.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution-kristenwyc.hosted_zone_id
    evaluate_target_health = false
  }
  zone_id = var.hosted_zone_id
}

resource "aws_route53_record" "route53record-2" {
  name = var.domain_name
  type = "AAAA"
  alias {
    name                   = aws_cloudfront_distribution.s3_distribution-kristenwyc.domain_name
    zone_id                = aws_cloudfront_distribution.s3_distribution-kristenwyc.hosted_zone_id
    evaluate_target_health = false
  }
  zone_id = var.hosted_zone_id
}

resource "aws_route53_zone" "route53_zone" {
  name    = var.domain_name
  comment = ""
}

resource "aws_route53_record" "route53record-3" {
  name = var.domain_name
  type = "NS"
  ttl  = 172800
  records = [
    "ns-1971.awsdns-54.co.uk.",
    "ns-1052.awsdns-03.org.",
    "ns-442.awsdns-55.com.",
    "ns-522.awsdns-01.net."
  ]
  zone_id = var.hosted_zone_id
}

resource "aws_route53_record" "route53record-4" {
  name = var.domain_name
  type = "SOA"
  ttl  = 900
  records = [
    "ns-1971.awsdns-54.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"
  ]
  zone_id = var.hosted_zone_id
}

resource "aws_route53_record" "route53record-5" {
  name = "_3e05c730195974d187bf74c8632ceac3.${var.domain_name}."
  type = "CNAME"
  ttl  = 300
  records = [
    "_f31c250d87555ea503395158f337b123.fgsdscwdjl.acm-validations.aws."
  ]
  zone_id = var.hosted_zone_id
}

resource "aws_route53_record" "route53record-6" {
  name = "api.${var.domain_name}."
  type = "A"
  alias {
    name                   = var.record_api_value
    zone_id                = var.api_gateway_hosted_zone_ID
    evaluate_target_health = true
  }
  zone_id = var.hosted_zone_id
}


resource "aws_route53_record" "route53record-7" {
  name = "_fffb5d0d2b1dc94ef730128c7203c9a0.api.${var.domain_name}."
  type = "CNAME"
  ttl  = 300
  records = [
    "_6e59be22d5ddeca89d562e3c1dad0e6b.tctzzymbbs.acm-validations.aws."
  ]
  zone_id = var.hosted_zone_id
}


resource "aws_route53_record" "route53record-8" {
  name = "www.${var.domain_name}."
  type = "CNAME"
  ttl  = 300
  records = [
    var.record_cloudfront_value
  ]
  zone_id = var.hosted_zone_id
}

resource "aws_route53_record" "route53record-9" {
  name = "_b1f0a56f695a4434a786efb8f6b9cc8f.www.${var.domain_name}."
  type = "CNAME"
  ttl  = 300
  records = [
    "_de4d47fd3cf2fb79266bf9ddf97024df.fgsdscwdjl.acm-validations.aws."
  ]
  zone_id = var.hosted_zone_id

}
