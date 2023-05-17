resource "aws_api_gateway_rest_api" "api-gateway-kristenwyc" {
  name           = "Cloud-Resume-Visitor-Counter"
  api_key_source = "HEADER"
  endpoint_configuration {
    types = [
      "EDGE"
    ]
  }
}

resource "aws_api_gateway_stage" "api-gateway-stage-kristenwyc" {
  stage_name    = "dev"
  deployment_id = aws_api_gateway_deployment.ApiGatewayDeployment1.id
  rest_api_id   = aws_api_gateway_rest_api.api-gateway-kristenwyc.id
}

resource "aws_api_gateway_deployment" "ApiGatewayDeployment1" {
  rest_api_id = aws_api_gateway_rest_api.api-gateway-kristenwyc.id
}

resource "aws_api_gateway_resource" "api_gateway_resource" {
  rest_api_id = aws_api_gateway_rest_api.api-gateway-kristenwyc.id
  parent_id   = ""
  path_part   = ""
}

resource "aws_api_gateway_method" "api-gateway-method1" {
  rest_api_id      = aws_api_gateway_rest_api.api-gateway-kristenwyc.id
  resource_id      = var.resource_id
  http_method      = "OPTIONS"
  authorization    = "NONE"
  api_key_required = false
}


resource "aws_api_gateway_method" "api-gateway-method2" {
  rest_api_id      = aws_api_gateway_rest_api.api-gateway-kristenwyc.id
  resource_id      = var.resource_id
  http_method      = "GET"
  authorization    = "NONE"
  api_key_required = false
}

resource "aws_api_gateway_method" "api-gateway-method3" {
  rest_api_id      = aws_api_gateway_rest_api.api-gateway-kristenwyc.id
  resource_id      = var.resource_id
  http_method      = "POST"
  authorization    = "NONE"
  api_key_required = false
}

resource "aws_api_gateway_domain_name" "ApiGatewayDomainName1" {
  domain_name = "api.kristenwyc.com"
  endpoint_configuration {
    types = [
      "REGIONAL"
    ]
  }
  regional_certificate_arn = var.regional_certificate_arn
}

resource "aws_apigatewayv2_domain_name" "ApiGatewayV2DomainName1" {
  domain_name = "api.kristenwyc.com"
  domain_name_configuration {
    certificate_arn = var.certificate_arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }
}

resource "aws_apigatewayv2_api_mapping" "ApiGatewayV2ApiMapping" {
  api_id          = aws_api_gateway_rest_api.api-gateway-kristenwyc.id
  domain_name     = "api.kristenwyc.com"
  stage           = "dev"
  api_mapping_key = ""
}

resource "aws_api_gateway_base_path_mapping" "ApiGatewayBasePathMapping" {
  domain_name = aws_apigatewayv2_domain_name.ApiGatewayV2DomainName1.id
  api_id      = aws_api_gateway_rest_api.api-gateway-kristenwyc.id
  stage_name  = "dev"
}

