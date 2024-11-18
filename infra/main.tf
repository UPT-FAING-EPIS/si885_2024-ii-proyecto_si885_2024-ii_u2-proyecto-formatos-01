variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
}

variable "aws_session_token" {
  description = "AWS Session Token"
  type        = string
}

provider "aws" {
  access_key       = var.aws_access_key_id
  secret_access_key = var.aws_secret_access_key
  session_token     = var.aws_session_token
  region           = "us-east-1"
  output           = "json"
}
