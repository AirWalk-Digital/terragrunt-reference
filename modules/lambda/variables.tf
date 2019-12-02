variable "aws_region" {
  description = "The AWS region to deploy to e.g. us-east-1"
  type        = string
}
variable "environment" {
  description = "The Environment this will be deployed into (e.g. production / test)"
  type        = string
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}
variable "aws_profile" {
  description = "The profile used for authentication"
  type        = string
}
variable "api_domain_name" {
  description = "The URL for the API"
  type        = string
}
variable "www_domain_name" {
  description = "The URL for the Website"
  type        = string
}
variable "domain" {
  description = "Base url"
  type        = string
}
variable "AZURE_TENANT_ID" {
  description = "The AzureAD Tennant"
  type        = string
}
variable "CLIENT_ID" {
  description = "AzureAD Application Client ID"
  type        = string
}
variable "CLIENT_SECRET" {
  description = "AzureAD Application Client Secret"
  type        = string
}
variable "REDIRECT_URI" {
  description = "The API Gateway Callback URI)"
  type        = string
}
variable "API_STAGE" {
  description = "The API Version"
  type        = string
}
variable "AUTH_PATH" {
  description = "The path the Auth API is available on CloudFront (i.e. /auth)"
  type        = string
}

variable "APP_URI" {
  description = "The target application"
  type        = string
}
variable "FLASK_SECRET" {
  description = "The secret for use in the Flask app"
  type        = string
}
variable "CLOUDFRONT_KEY_ID" {
  description = "The CloudFront Signing Key ID (from the root user)"
  type        = string
}
variable "routing_rules" {
  description = "A json array containing routing rules describing redirect behavior and when redirects are applied"
  type        = "string"

  default = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "/"
    },
    "Redirect": {
        "ReplaceKeyWith": "index.html"
    }
}]
EOF
}