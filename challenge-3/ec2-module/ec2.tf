resource "aws_instance" "dbserverec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    tags = {
        Name = "DB server"
    }
}

#use http to acces this endpoint since there are no certificate attached
resource "aws_instance" "webserverec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    security_groups = [module.sgmodule.instance_name]
    user_data = file("${path.module}/server-script.sh")
    tags = {
        Name = "Web server"
    }
}

resource "aws_eip" "elasticip" {
    instance = aws_instance.webserverec2.id
}

module "sgmodule" {
    source = "../sg-module"
}

output "web_ec2_instance_id" {
    value = aws_instance.webserverec2.id
}

output "db_ec2_instance_id" {
    value = aws_instance.dbserverec2.id
}

output "db_ec2_private_ip" {
    value = aws_instance.dbserverec2.private_ip
}

output "web_ec2_public_ip" {
    value = aws_instance.webserverec2.public_ip
}