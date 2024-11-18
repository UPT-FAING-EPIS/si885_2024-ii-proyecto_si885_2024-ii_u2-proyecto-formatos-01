# Proveedor AWS
provider "aws" {
  region = "us-east-1"  # Cambia la región según sea necesario
}

# Crear una VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}

# Crear un Internet Gateway y asociarlo con la VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-igw"
  }
}

# Crear una Subnet pública en la VPC
resource "aws_subnet" "my_subnet_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "my-public-subnet"
  }
}

# Crear una Subnet privada en la VPC
resource "aws_subnet" "my_subnet_2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "my-private-subnet"
  }
}

# Crear un Grupo de Seguridad dentro de la misma VPC
resource "aws_security_group" "my_db_sg" {
  name        = "my-db-sg"
  vpc_id      = aws_vpc.my_vpc.id
  description = "Security group for RDS DB instance"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Puedes ajustar este rango si necesitas más seguridad
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Crear un DB Subnet Group para RDS
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "my-db-subnet-group"
  subnet_ids  = [aws_subnet.my_subnet_1.id, aws_subnet.my_subnet_2.id]
  description = "My DB Subnet Group"
}

# Crear una instancia de RDS MySQL
resource "aws_db_instance" "mydb_instance" {
  identifier           = "mydb-instance"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.my_db_sg.id]  # Referencia al grupo de seguridad creado
  username             = "admin"
  password             = "MySecurePassword123!"
  db_name              = "mydatabase"
  publicly_accessible  = true
  multi_az             = false
  backup_retention_period = 7
}
