provider "aws" {
    region = "ap-southeast-1"
}

variable "ingressrules" {
    type = list(number)
    default = [80, 443]
}

variable "egressrules" {
    type = list(number)
    default = [80, 443, 25, 3306, 53, 8080]
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

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}