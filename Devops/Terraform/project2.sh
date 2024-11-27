provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVpc"
  }
}

# Create public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a" # Change this to your desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1a"
  }
}

# Create public subnet
resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b" # Change this to your desired AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1b"
  }
}

# Create private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b" # Change this to your desired AZ

   tags = {
    Name = "private-subnet-1b"
  }
}

# Create private subnet
resource "aws_subnet" "private_subnet_1a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a" # Change this to your desired AZ

   tags = {
    Name = "private-subnet-1a"
  }
}



# Create internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create route table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

# Create route for internet gateway
resource "aws_route" "route_to_igw" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_igw.id
}

# Associate public subnet with route table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

# Create NAT gateway
resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

# Create Elastic IP for NAT gateway
resource "aws_eip" "my_eip" {
}

# Create Elastic Load Balancer
resource "aws_lb" "my_elb" {
  name               = "my-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_sg.id]
  subnets            = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id]
}

# Launch EC2 instance in the public subnet
resource "aws_instance" "my_instance" {
  ami           = "ami-0fc5d935ebf8bc3bc" # Replace with your desired AMI ID
  instance_type = "t2.micro" # Replace with your desired instance type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = "micro-service" # Replace with your key pair name
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "MyInstance"
  }
}
resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id
  // Add your security group rules as needed
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   // Allow traffic on port 8080
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


Access key ID	Secret access key
AKIAZUPNF4FRS2LWG4RU	FXTI7COuBg6ZjQ4c52qx5G+AlEO+WEFw55fyF+OX


