resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "automated-vpc"
    }  
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "Public_Subnet_automated_subnet"
    }  
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.2.0.0/24"
    tags = {
      Name = "private_subnet_automated_subnet"
    }
  
}

resource "aws_internet_gateway" "automated_IGW" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "automated_igw"

    }
  
}

