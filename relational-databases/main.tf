provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_db_instance" "rds"{
    db_name = "DB" #name is deprecated
    identifier = "first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.6.10"
    username = "admin"
    password = "12345678"
    port = 3306
    allocated_storage = 20
    skip_final_snapshot = true #skip taking any snapshot when the instance is being destroyed.
}