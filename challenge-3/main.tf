provider "aws" {
    region = "ap-southeast-1"
}

module "ec2module" {
    source = "./ec2-module"
}

output "ec2_module_db_output" {
    value = module.ec2module.db_ec2_instance_id
}

output "ec2_module_web_output" {
    value = module.ec2module.web_ec2_instance_id
}

output "PrivateIP" {
    value = module.ec2module.db_ec2_private_ip
}

output "PublicIP" {
    value = module.ec2module.web_ec2_public_ip
}