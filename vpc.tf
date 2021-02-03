# Define a vpc
resource "aws_vpc" "test_vpc" {
  cidr_block = "200.0.0.0/16"
  tags = {
    Name = "ecstest_vpc"
  }
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "demoIG" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  tags = {
    Name = "ecsDemoIG"
  }
}

# Public subnet
resource "aws_subnet" "test_public_sn_01" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  cidr_block = "200.0.0.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "ecstest_public_sn_01-0"
  }
}

# Public subnet
resource "aws_subnet" "test_public_sn_02" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  cidr_block = "200.0.1.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "ecstest_public_sn_02-0"
  }
}

# Routing table for public subnet
resource "aws_route_table" "test_public_sn_ro" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.demoIG.id}"
  }
  tags = {
    Name = "test_public_sn_ro"
  }
}

# Associate the routing table to public subnet

resource "aws_route_table_association" "test_public_sn_roAssn" {
  subnet_id = "${aws_subnet.test_public_sn_01.id}"
  route_table_id = "${aws_route_table.test_public_sn_ro.id}"
}

# ECS Instance Security group

resource "aws_security_group" "test_public_sg" {
    name = "test_public_sg"
    description = "Test public access security group"
    vpc_id = "${aws_vpc.test_vpc.id}"

   ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = [
          "0.0.0.0/0"]
   }

   ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [
          "0.0.0.0/0"]
   }

   ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = [
          "0.0.0.0/0"]
    }

   ingress {
      from_port = 0
      to_port = 0
      protocol = "tcp"
      cidr_blocks = [
         "${var.test_public_01_cidr}",
         "${var.test_public_02_cidr}"]
    }

    egress {
        # allow all traffic to private SN
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = [
            "0.0.0.0/0"]
    }

    tags = { 
       Name = "test_public_sg"
    }
}
