#### RDS ####
resource "aws_db_subnet_group" "three-tier-db-sub-grp" {
  name       = "three-tier-db-sub-grp"
  subnet_ids = ["${aws_subnet.three-tier-pvt-sub-3.id}","${aws_subnet.three-tier-pvt-sub-4.id}"]
}



resource "aws_db_instance" "three-tier-db" {
  allocated_storage           = 100
  storage_type                = "gp3"
  engine                      = "mysql"
  engine_version              = "8.0"
  instance_class              = "db.t2.micro"
  identifier                  = "three-tier-db"
  username                    = "admin"
  password                    = "23vS5TdDW8*o"
  parameter_group_name        = "default.mysql8.0"
  db_subnet_group_name        = aws_db_subnet_group.three-tier-db-sub-grp.name
  vpc_security_group_ids      = ["${aws_security_group.three-tier-db-sg.id}"]
  #availability_zone           = "ap-southeast-2a"
  #allow_major_version_upgrade = true
  #auto_minor_version_upgrade  = true
  #backup_retention_period     = 7
  #backup_window               = "21:30-22:00"
  #maintenance_window          = "Sat:20:30-Sat:21:00"
  multi_az                    = true
  skip_final_snapshot         = true
  #storage_encrypted           = true
  #kms_key_id                  = "arn:aws:kms:ap-southeast-1:148866320314:key/097b9cd6-0d99-4528-b353-6e3689319813"
  #max_allocated_storage       = 1000
  #deletion_protection         = true
  #apply_immediately           = false
  publicly_accessible          = false

  lifecycle {
    prevent_destroy = true
    ignore_changes  = all
  }
}