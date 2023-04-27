provider "aws" {
    region = "ap-southeast-1"
}

variable "ingressrules" {
    type = list(number)
    default = [80, 443]
}

variable "egressrules" {
    type = list(number)
    default = [80, 443]
}

resource "aws_instance" "dbserverec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    tags = {
        Name = "DB server"
    }
}

resource "aws_instance" "webserverec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
    user_data = file("server-script.sh")
    tags = {
        Name = "Web server"
    }
}

resource "aws_eip" "elasticip" {
    instance = aws_instance.webserverec2.id
}

resource "aws_security_group" "webtraffic" {
    name = "Allow web traffic"

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

    tags = {
        Name = "web-traffic-sg"
    }
}

output "PrivateIP" {
    value = aws_instance.dbserverec2.private_ip
}

output "PublicIP" {
    value = aws_instance.webserverec2.public_ip
}