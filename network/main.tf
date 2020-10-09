# vpc
# 2 public subnets
# 2 private subnet
# 1 user subnet
# internet gateway
# custom public routetable with route to internetgateway
# route table associations for both the public subnets
# ----- networking/main.tf
provider aws {
  shared_credentials_file = var.shared_credentials
  profile                 = var.profile
  region                  = var.region
}

data "aws_availability_zones" "available" {
  filter {
   name = "region-name"
   values = [var.aws_region]
 }
}

#vpc
resource "aws_vpc" "splunkvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name    = "splunk_vpc"
    project = "splunk"
    group   = "splunk"
  }
}

#internet gateway
resource "aws_internet_gateway" "splunk_igw" {
  vpc_id = aws_vpc.splunkvpc.id
  tags = {
    Project = var.project_name
    group   = "splunk"
    Name    = "splunk_igw"
  }
}

# public route table
resource "aws_route_table" "splunk_route_table_public" {
  vpc_id = aws_vpc.splunkvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.splunk_igw.id
  }
  tags = {
    Name    = "splunk_public_rt"
    Project = var.project_name
    group   = "splunk"
  }
}

# private route table
resource "aws_route_table" "splunk_route_table_private" {
  vpc_id = aws_vpc.splunkvpc.id

  tags = {
    Name    = "splunk_private_rt"
    Project = var.project_name
    Group   = "splunk"
  }
}

#create two public subnets
resource "aws_subnet" "splunk_subnet_public" {
  count                   = 2
  vpc_id                  = aws_vpc.splunkvpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name    = "splunk_public_subnet_${count.index + 1}"
    Project = var.project_name

  }
}


#create two private subnets
resource "aws_subnet" "splunk_subnet_private" {
  count             = 2
  vpc_id            = aws_vpc.splunkvpc.id
  cidr_block        = var.private_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name    = "splunk_private_subnet_${count.index + 1}"
    Project = var.project_name

  }
}

#create a private subnet, this is where users live
resource "aws_subnet" "splunk_user_subnet" {
  vpc_id            = aws_vpc.splunkvpc.id
  cidr_block        = var.user_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name    = "splunk_user_subnet"
    Project = var.project_name

  }
}

#route table association - public
resource "aws_route_table_association" "splunk_public_rt_assoc" {
  count          = length(aws_subnet.splunk_subnet_public)
  subnet_id      = aws_subnet.splunk_subnet_public.*.id[count.index]
  route_table_id = aws_route_table.splunk_route_table_public.id
}


#route table association - public
resource "aws_route_table_association" "splunk_private_rt_assoc" {
  count          = length(aws_subnet.splunk_subnet_private)
  subnet_id      = aws_subnet.splunk_subnet_private.*.id[count.index]
  route_table_id = aws_route_table.splunk_route_table_private.id
}

