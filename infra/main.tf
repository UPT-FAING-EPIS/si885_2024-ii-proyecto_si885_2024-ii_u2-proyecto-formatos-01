# Proveedor AWS
provider "aws" {
  region = var.region
}

# Buscar la VPC existente
data "aws_vpc" "lab_vpc" {
  id = "vpc-02ee44d7135379986"
}

# Usar el grupo de subredes predeterminado de la VPC
data "aws_db_subnet_group" "default" {
  name = "default-vpc-02ee44d7135379986"
}

# Crear el Security Group para RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Security group for RDS instance"
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-security-group"
  }
}

resource "aws_db_instance" "labRDS" {
  identifier            = "labrds-instance"
  engine                = "mysql"
  engine_version        = "5.7"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  storage_type          = "gp2"
  db_subnet_group_name  = data.aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  username              = "admin"
  password              = "MySecurePassword123!"
  db_name               = "mydatabase"
  publicly_accessible   = true
  multi_az              = false
  backup_retention_period = 7
  skip_final_snapshot   = true
  tags = {
    Name = "labrds-instance"
  }
}
