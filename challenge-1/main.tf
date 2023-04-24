provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_vpc" "myvpc" {
    tags = {
        Name = var.vpcname
    }
    cidr_block = "192.168.0.0/24"
}

variable "vpcname" {
    type = string
    default = "TerraformVPC"
}
