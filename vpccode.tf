resource "aws_vpc" "babaji-vpc" {
  cidr_block = var.cidrblock
  tags = {
    Name = var.vpcname
  }
}
resource "aws_subnet" "babaji-pub"{
  vpc_id = aws_vpc.babaji-vpc.id
  cidr_block = var.cidr_sub
  availability_zone = var.pubaz
  map_public_ip_on_launch =true
  tags = {
    Name = var.pubsubname
  }
}
resource "aws_subnet" "babaji-pub2"{
  vpc_id = aws_vpc.babaji-vpc.id
  cidr_block = var.cidr_pubsub2
  availability_zone = var.pubsubaz2
  map_public_ip_on_launch =true
  tags = {
    Name = var.pubsubname2
  }
 }
resource "aws_subnet" "babaji-pri"{
  vpc_id = aws_vpc.babaji-vpc.id
  cidr_block = var.cidrpri
  availability_zone = var.prisub1
  tags = {
    Name = var.prisubname
  }
}
resource "aws_subnet" "babaji-pri2"{
  vpc_id = aws_vpc.babaji-vpc.id
  cidr_block = var.cidrpri2
  availability_zone = var.prisub2
  tags = {
    Name = var.prisubname2
  }
}
resource "aws_internet_gateway" "babaji-igw"{
  vpc_id = aws_vpc.babaji-vpc.id
  tags = {
    Name = var.igw
  }
}
resource "aws_route" "default_internet_access"{
  route_table_id = aws_vpc.babaji-vpc.default_route_table_id
  destination_cidr_block = var.igwcidr
  gateway_id = aws_internet_gateway.babaji-igw.id
}
resource "aws_route_table_association" "pub1"{
  route_table_id = aws_vpc.babaji-vpc.default_route_table_id
  subnet_id = aws_subnet.babaji-pub.id
}
resource "aws_route_table_association" "pub2"{
  route_table_id = aws_vpc.babaji-vpc.default_route_table_id
  subnet_id = aws_subnet.babaji-pub2.id
}
