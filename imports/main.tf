provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_vpc" "myvpc-1" {
    tags = {
        Name = "vpc-1"
    }
    cidr_block = "10.0.0.0/16"
}

#importing vpc from the aws console
#terraform import aws_vpc.myvpc-2 vpc-0feb61443b7983b1b
resource "aws_vpc" "myvpc-2" {
    tags = {
        Name = "vpc-2"
    }
    cidr_block = "192.168.0.0/24"
}

