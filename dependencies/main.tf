provider "aws" {
    region = "ap-southeast-1"
}

resource "aws_instance" "ec2db" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    tags = {
        Name = "linux-ec2-db"
    }
}

#datasources are used for querying/API request to infrastruction or aws but not to store any information
resource "aws_instance" "ec2web" {
    ami = "ami-063e1495af50e6fd5"
    instance_type = "t2.micro"
    tags = {
        Name = "linux-ec2-web"
    }
    depends_on = [aws_instance.ec2db]
}
 
data "aws_instance" "dbsearch" {
    filter {
        name = "tag:Name"
        values = ["linux-ec2-db"]
    }
}

output "dbservers" {
    value = data.aws_instance.dbsearch.availability_zone
}