resource "aws_vpc" "dove" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "vprofile"
    Project = "vprofile"
  }
}
# creting a  subnet ressource 
resource "aws_subnet" "dove-priv-sub-1" {
  vpc_id     = aws_vpc.dove.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1

  tags = {
    Name = "dove-sub-1"
  }
}
resource "aws_subnet" "dove-priv-sub-2" {
  vpc_id     = aws_vpc.dove.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1

  tags = {
    Name = "dove-sub-2"
  }
}
resource "aws_subnet" "dove-priv-sub-1" {
  vpc_id     = aws_vpc.dove.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2

  tags = {
    Name = "dove-sub-1"
  }
}
# Pubic subnets  
resource "aws_subnet" "dove-pub-sub-1" {
  vpc_id     = aws_vpc.dove.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE3

  tags = {
    Name = "dove-sub-1"
  }
}
resource "aws_subnet" "dove-pub-sub-2" {
  vpc_id     = aws_vpc.dove.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE3

  tags = {
    Name = "dove-sub-2"
  }
}
resource "aws_subnet" "dove-pub-sub-3" {
  vpc_id     = aws_vpc.dove.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2

  tags = {
    Name = "dove-sub-3"
  }
}


resource "aws_internet_gateway" "dove-IGW" {
  vpc_id = aws_vpc.dove.id
  tags = {
    Name = "dove-IGW"
  }
}
# create the route  table  to  join   the  public  subnet  with the  igw 

resource "aws_route_table" "dove-pub-RT" {
  vpc_id = aws_vpc.dove.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dove-IGW.id
  }

  tags = {
    Name = "dove-pub-RT"
  }
}
#  association  between  a  subnet and a  routing table 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.dove-pub-sub-1.id
  route_table_id = aws_route_table.dove-pub-RT.id
}

# association for  subnet-1

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.dove-pub-sub-2.id
  route_table_id = aws_route_table.dove-pub-RT.id
}
# assocaition for subnet  2   
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.dove-pub-sub-2.id
  route_table_id = aws_route_table.dove-pub-RT.id
}
# assocaition for subnet  3   
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.dove-pub-sub-3.id
  route_table_id = aws_route_table.dove-pub-RT.id
}
