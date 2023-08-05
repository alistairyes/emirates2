resource "aws_db_subnet_group" "default" {
  name       = var.subnet_group_name
  subnet_ids = var.data_subnet_ids

  tags = {
    Name = var.subnet_group_name
  }
}

resource "aws_db_instance" "default" {
  depends_on             = [aws_security_group.default]
  identifier             = var.identifier
  allocated_storage      = var.storage
  engine                 = var.engine
  engine_version         = var.engine_version[var.engine]
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  vpc_security_group_ids = [aws_security_group.default.id]
  db_subnet_group_name   = aws_db_subnet_group.default.id

  tags = {
    Name = var.identifier
  }
}

# Additional configurations like RDS replicas, backups, etc. can be added here
