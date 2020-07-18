variable "name" {
  description = "The name of the API."
  type        = string
}

variable "protocol_type" {
  description = "The protocol type for the API."
  type        = string
  default     = "HTTP"
}

variable "lambda_arn" {
  description = "The arn of the lambda function to proxy."
  type        = string
}

variable "domain_name" {
  description = "Custom domain name to map to the API."
  type        = string
}

variable "certificate_arn" {
  description = "ACM certificate to use for the custom domain"
  type        = string
}

variable "security_policy" {
  description = "The TLS security policy / version to use"
  type        = string
  default     = "TLS_1_2"
}

variable "zone_id" {
  description = "The zone id to use when creating the required route53 record"
  type        = string
}
