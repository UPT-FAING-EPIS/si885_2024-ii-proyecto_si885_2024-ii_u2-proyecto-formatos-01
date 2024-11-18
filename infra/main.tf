# Proveedor de AWS
provider "aws" {
  region = "us-east-1"
}

# Definición de las subredes
data "aws_subnets" "vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = ["vpc-02ee44d7135379986"]
  }
}

# Verificar si el DB Subnet Group existe
resource "aws_db_subnet_group" "my_db_subnet_group" {
  count                   = length(data.aws_subnets.vpc_subnets.ids) > 0 ? 1 : 0
  db_subnet_group_name     = "my-db-subnet-group"
  db_subnet_group_description = "My DB Subnet Group_PALBERT"
  subnet_ids              = data.aws_subnets.vpc_subnets.ids

  lifecycle {
    create_before_destroy = true
  }
}

# Definir la instancia RDS
resource "aws_db_instance" "my_db_instance" {
  count                  = length(aws_db_subnet_group.my_db_subnet_group) > 0 ? 1 : 0
  db_instance_identifier = "mydb-instance"
  db_instance_class     = "db.t3.micro"
  engine                = "mysql"
  engine_version        = "5.7"
  allocated_storage     = 20
  storage_type          = "gp2"
  vpc_security_group_ids = ["sg-08db0d68f1b78a11e"]
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group[0].db_subnet_group_name
  master_username        = "admin"
  master_password        = "MySecurePassword123!"
  db_name                = "mydatabase"
  publicly_accessible    = true
  multi_az               = false
  backup_retention_period = 7

  lifecycle {
    create_before_destroy = true
  }
}

# Mostrar las subredes dentro de la VPC
output "subnets_in_vpc" {
  value = data.aws_subnets.vpc_subnets.ids
}
