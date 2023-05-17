# api_gateway

variable "deployment_id" {
  description = "ID of deployment"
  type        = string
}

variable "rest_api_id" {
  description = "ID of the associated REST API"
  type        = string
}

variable "resource_id" {
  description = "ID of the resource"
  type        = string
}

# cloudfront

variable "origin_id" {
  type = string
}

variable "regional_certificate_arn" {
  description = "ARN for an AWS-managed certificate_regional_custom"
  type        = string
}

variable "certificate_arn" {
  type = string
}

variable "acm_certificate_arn" {
  type = string
}

variable "ordered_cache_behavior_cache_policy_id" {
  type = string
}

variable "origin_access_control_id" {
  type = string
}

variable "default_cache_behavior_cache_policy_id" {
  type = string
}

# lambda

variable "lambda_s3_bucket" {
  type = string
}


variable "lambda_s3_key" {
  type = string
}

variable "lambda_s3_object_version" {
  type = string
}

variable "lambda_role" {
  type = string
}

# route53

variable "hosted_zone_id" {
  type = string
}

variable "domain_name" {
  type = string

}

variable "record_api_value" {
  type = string
}

variable "record_cloudfront_value" {
  type = string
}

variable "api_gateway_hosted_zone_ID" {
  type = string
}
