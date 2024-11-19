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
resource "aws_instance" "example" {
  instance_type = var.instance_class
  ami            = "ami-123456"
  region         = var.region
}

resource "aws_db_instance" "example_db" {
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  region = var.region
  engine = "mysql"
}
