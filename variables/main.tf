provider "aws" {
    region = "ap-southeast-1"
}

variable "vpcname" {
    type = string
    default = "my_vpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = ["value1", "value2"]
}

variable "mymap" {
    type = map
    default = {
        Key1 = "Value1" 
        Key2 = "Value2"
    }
}

resource "aws_vpc" "myvpc" {
    tags = {
        Name = var.vpcname
    }
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc1" {
    tags = {
        Name = var.mylist[0]
    }
    cidr_block = "10.0.0.0/17"
}

resource "aws_vpc" "myvpc2" {
    tags = {
        Name = var.mymap["Key2"]
    }
    cidr_block = "10.0.0.0/18"
}