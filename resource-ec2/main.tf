provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_instance" "nitin-ec2" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    tags = {
        Name = "linux-ec2"
    }
}