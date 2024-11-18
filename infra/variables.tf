variable "instance_class" {
  default = "db.t3.micro"
}

variable "allocated_storage" {
  default = 20
}
variable "region" {
  description = "La región de AWS"
  type        = string
  default     = "us-east-1"  # Puedes asignar una región predeterminada o dejarlo vacío
}
