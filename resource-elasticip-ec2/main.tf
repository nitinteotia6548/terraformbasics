provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_instance" "nitinec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    tags = {
        Name = "linux-ec2"
    }
}

resource "aws_eip" "elasticip" {
    instance = aws_instance.nitinec2.id
}

output "EIP" {
    value = aws_eip.elasticip.public_ip
}