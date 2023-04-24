provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_vpc" "myvpc" {
    tags = {
        Name = "vpc-1"
    }
    cidr_block = "10.0.0.0/16"
}

