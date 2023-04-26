provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
}