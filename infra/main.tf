provider "aws" {
  access_key     = var.AWS_ACCESS_KEY_ID
  secret_access_key = var.AWS_SECRET_ACCESS_KEY
  session_token  = var.AWS_SESSION_TOKEN
  region         = "us-east-1"
}

resource "null_resource" "aws_sts_identity" {
  provisioner "local-exec" {
    command = "aws sts get-caller-identity"
  }
}
