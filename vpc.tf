#create VPC

resource "aws_vpc" "test_vpc" {
    cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Terraform VPC"
  }
}

#create public subnet

resource "aws_subnet" "PublicSubnet" {
    vpc_id = aws_vpc.test_vpc.id
    cidr_block = "10.0.1.0/24"
}

#create private subnet

resource "aws_subnet" "PrivateSubnet" {
    vpc_id = aws_vpc.test_vpc.id
    cidr_block = "10.0.2.0/24"
  
}

#create Internet Gateway

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.test_vpc.id
  }

 #create route tables for public subnet
 resource "aws_route_table" "publicRT" {
    vpc_id = aws_vpc.test_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
   
 }