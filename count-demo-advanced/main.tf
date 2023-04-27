provider "aws" {
    region = "ap-southeast-1"
}

module "ec2db" {
    source = "./ec2-module"
    server_names = ["mariadb", "mysql", "mssql"]
}

output "private_ips" {
    value = module.ec2db.db_ec2_private_ip
}