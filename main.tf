# The API
resource "aws_apigatewayv2_api" "main" {
  name          = var.name
  protocol_type = var.protocol_type
  target        = var.lambda_arn
}

# Custom Domain
resource "aws_apigatewayv2_domain_name" "main" {
  domain_name = var.domain_name

  domain_name_configuration {
    certificate_arn = var.certificate_arn
    security_policy = var.security_policy
    endpoint_type   = "REGIONAL"
  }
}

# DNS record for the Custom Domain
resource "aws_route53_record" "main" {
  name    = aws_apigatewayv2_domain_name.main.domain_name
  zone_id = var.zone_id
  type    = "A"

  alias {
    name                   = aws_apigatewayv2_domain_name.main.domain_name_configuration.0.target_domain_name
    zone_id                = aws_apigatewayv2_domain_name.main.domain_name_configuration.0.hosted_zone_id
    evaluate_target_health = false
  }
}

# Mapping for the custom domain to the API
resource "aws_apigatewayv2_api_mapping" "main" {
  api_id      = aws_apigatewayv2_api.main.id
  domain_name = aws_apigatewayv2_domain_name.main.id
  stage       = "$default"
}

# Permissions to execute the lambda
resource "aws_lambda_permission" "main" {
  action        = "lambda:InvokeFunction"
  principal     = "apigateway.amazonaws.com"
  function_name = var.lambda_arn

  source_arn = "${aws_apigatewayv2_api.main.execution_arn}/*/*"
}
