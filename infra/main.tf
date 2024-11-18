# Proveedor AWS
provider "aws" {
  region = "us-east-1"  # Cambiar si es necesario
}

# Crear una nueva VPC
resource "aws_vpc" "new_vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "new-vpc"
  }
}

# Crear un Internet Gateway y asociarlo con la nueva VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.new_vpc.id
  tags = {
    Name = "my-igw"
  }
}

# Crear Subnet 1 - 172.31.16.0/20 en la zona us-east-1d
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "172.31.16.0/20"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-1"
  }
}

# Crear Subnet 2 - 172.31.32.0/20 en la zona us-east-1a
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "172.31.32.0/20"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-2"
  }
}

# Crear Subnet 3 - 172.31.64.0/20 en la zona us-east-1f
resource "aws_subnet" "subnet_3" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "172.31.64.0/20"
  availability_zone       = "us-east-1f"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-3"
  }
}

# Crear Subnet 4 - 172.31.48.0/20 en la zona us-east-1e
resource "aws_subnet" "subnet_4" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "172.31.48.0/20"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-4"
  }
}

# Crear Subnet 5 - 172.31.80.0/20 en la zona us-east-1c
resource "aws_subnet" "subnet_5" {
  vpc_id                  = aws_vpc.new_vpc.id
  cidr_block              = "172.31.80.0/20"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-5"
  }
}

# Crear un Security Group para las subredes
resource "aws_security_group" "default_sg" {
  name        = "default-security-group"
  description = "Default security group for new VPC"
  vpc_id      = aws_vpc.new_vpc.id

  # Permitir acceso SSH (puerto 22) desde cualquier IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Permitir acceso a MySQL (puerto 3306) desde cualquier IP
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Reglas de salida
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir tráfico saliente hacia cualquier dirección
  }

  tags = {
    Name = "default-sg"
  }
}

# Crear un DB Subnet Group para RDS
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "my-db-subnet-group"
  subnet_ids  = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id,
    aws_subnet.subnet_3.id,
    aws_subnet.subnet_4.id,
    aws_subnet.subnet_5.id
  ]
  description = "Subnet group for RDS instance"
}

# Crear una instancia de RDS MySQL
resource "aws_db_instance" "mydb_instance" {
  identifier            = "mydb-instance"
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t3.micro"  # Ajusta según el tipo de instancia que necesites
  allocated_storage     = 20  # Ajusta el tamaño de almacenamiento según lo que necesites
  storage_type          = "gp2"
  db_subnet_group_name  = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.default_sg.id]
  username              = "admin"
  password              = "MySecurePassword123!"
  db_name               = "mydatabase"
  publicly_accessible   = true  # Habilitar acceso público
  multi_az              = false
  backup_retention_period = 7
  skip_final_snapshot   = true  # Opcional: evitar crear un snapshot final al eliminar
  tags = {
    Name = "mydb-instance"
  }
}
