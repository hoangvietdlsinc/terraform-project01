resource "aws_db_instance" "myrds01" {
    count = var.db_count
    instance_class = var.db_instance
    engine = var.db_engine
    engine_version = var.db_engine_version
    #multi_az = var.db_multi_az \\disable multi az
    storage_type = var.db_storage_type
    allocated_storage = var.db_allocated_storage
    name = var.env_name["instance_name"]
    username = var.login_info["db_username"]
    password = var.login_info["db_password"]
    apply_immediately = var.apply_immediate
    backup_retention_period = var.backup_retention
    backup_window = var.backup_time
    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
    vpc_security_group_ids = [ var.database_sg ]
    identifier = var.env_name["identifier"]
    final_snapshot_identifier = var.final_snapshot
    tags = {
      "Name" = "MYRDS01"
      "CreateBy" = "HOANGVIET"
    }
}
resource "aws_db_subnet_group" "rds_subnet_group" {
    name = var.env_name["rds_subnet_name"]
    subnet_ids = [ var.priv_subnet1 , var.priv_subnet2]
}

  
