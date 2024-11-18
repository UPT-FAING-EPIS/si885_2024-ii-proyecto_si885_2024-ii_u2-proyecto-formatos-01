output "rds_endpoint" {
  description = "El endpoint de la instancia RDS"
  value       = aws_db_instance.mydb_instance.endpoint
}

output "rds_port" {
  description = "El puerto de la instancia RDS"
  value       = aws_db_instance.mydb_instance.port
}

output "vpc_id" {
  description = "El ID de la VPC creada"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_id" {
  description = "El ID de la subred pública"
  value       = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "El ID de la subred privada"
  value       = aws_subnet.private_subnet.id
}
