resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "automated-vpc"
    }  
}

resource "aws_subnet" "subnet_auto" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "Public_Subnet_automated_subnet"
    }  
}

