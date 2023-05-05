resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/26"
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
    cidr_block = "10.0.2.0/24"
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

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.automated_IGW.id
    }
    tags = {
        Name = "public_rt"
    }
  
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.main.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.automated_IGW.id
    }
    tags = {
        Name = "private-rt"
    }
  
}

# resource "aws_eip" "auto_eip" {    
#     tags = {
#         Name = "auto_eip"
#     }
# }

# resource "aws_nat_gateway" "auto_nat" {
#     allocation_id = aws_eip.auto_eip.id
#     subnet_id = aws_subnet.public.id

#     tags = {
#         Name = "automated_NAT"
#     }

#     depends_on = [ aws_internet_gateway.automated_IGW ]
  
# }

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_rt.id
  
}

resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private_rt.id
}
