variable "server_names" {
    type = list(string)
}

resource "aws_instance" "dbserverec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
        Name = var.server_names[count.index]
    }
}

output "db_ec2_private_ip" {
    value = aws_instance.dbserverec2.*.private_ip
}