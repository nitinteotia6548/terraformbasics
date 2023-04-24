provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_instance" "nitinec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.ec2traffic.name]
    tags = {
        Name = "linux-ec2"
    }
}

resource "aws_security_group" "ec2traffic" {
    name = "Allow HTTPS"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}