# Proveedor AWS
provider "aws" {
  region = "us-east-1"  # Puedes cambiar la región si es necesario
}

# Referenciar la VPC existente por su ID
data "aws_vpc" "existing_vpc" {
  id = "vpc-02ee44d7135379986"  # ID de la VPC existente
}

# Crear un Internet Gateway y asociarlo con la VPC existente
resource "aws_internet_gateway" "my_igw" {
  vpc_id = data.aws_vpc.existing_vpc.id
  tags = {
    Name = "my-igw"
  }
}

# Crear una Subnet pública en la VPC existente
resource "aws_subnet" "public_subnet" {
  vpc_id                  = data.aws_vpc.existing_vpc.id
  cidr_block              = "172.31.1.0/24"  # Cambié el CIDR por 172.31.1.0/24
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet"
  }
}

# Crear una Subnet privada en la VPC existente
resource "aws_subnet" "private_subnet" {
  vpc_id                  = data.aws_vpc.existing_vpc.id
  cidr_block              = "172.31.2.0/24"  # Cambié el CIDR por 172.31.2.0/24
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet"
  }
}

# Crear un Security Group para RDS en la VPC existente (permitir acceso sin restricciones)
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Security group for RDS instance"
  vpc_id      = data.aws_vpc.existing_vpc.id

  # Permitir acceso a MySQL (puerto 3306) desde cualquier IP
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Acceso público desde cualquier lugar
  }

  # Reglas de salida
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir tráfico saliente hacia cualquier dirección
  }

  tags = {
    Name = "rds-security-group"
  }
}

# Crear un DB Subnet Group para RDS en la VPC existente
resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "my-db-subnet-group"
  subnet_ids  = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
  description = "Subnet group for RDS instance"
}

# Crear una instancia de RDS MySQL en la VPC existente
resource "aws_db_instance" "mydb_instance" {
  identifier            = "mydb-instance"
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t3.micro"  # Ajusta según el tipo de instancia que necesites
  allocated_storage     = 20  # Ajusta el tamaño de almacenamiento según lo que necesites
  storage_type          = "gp2"
  db_subnet_group_name  = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
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
