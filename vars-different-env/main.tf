provider "aws" {
    region = "ap-southeast-1"
}

variable "number_of_servers" {
    type = number
}

resource "aws_instance" "nitinec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    count = var.number_of_servers 
    tags = {
        Name = "linux-ec2"
    }
}