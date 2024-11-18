# Definición de variables en Terraform

variable "region" {
  description = "La región de AWS en la que se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "instance_class" {
  description = "Clase de la instancia RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Espacio de almacenamiento asignado a la instancia RDS"
  type        = number
  default     = 20
}
