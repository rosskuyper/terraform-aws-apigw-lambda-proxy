output "api_id" {
  value = aws_apigatewayv2_api.main.id
}

output "api_arn" {
  value = aws_apigatewayv2_api.main.arn
}

output "api_execution_arn" {
  value = aws_apigatewayv2_api.main.execution_arn
}

output "api_invoke_api_endpoint" {
  value = aws_apigatewayv2_api.main.api_endpoint
}

output "api_custom_domain_name" {
    value = aws_apigatewayv2_domain_name.main.domain_name
}

output "route53_record_name" {
    value = aws_route53_record.main.name
}

output "route53_record_fqdn" {
    value = aws_route53_record.main.fqdn
}
