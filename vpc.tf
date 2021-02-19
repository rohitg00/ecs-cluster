provider "aws" {
  region     = "us-east-1"
  profile    = "Username"
}

######################################################################################
variable "test_vpc" {
  description = "VPC name for Test environment"
  type = string
  default = "vpc-407a6528"   #its just a variable. terraform will pick default vpc.
}

variable "test_network_cidr" {
  description = "IP addressing for Test Network"
  default = "200.0.0.0/16"
}

variable "test_public_01_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
  default = "200.0.0.0/24"
}

variable "test_public_02_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
  default = "200.0.1.0/24"
}
########################################################################################
# Define a vpc
resource "aws_default_vpc" "test_vpc" {

  tags = {
    Name = "Default VPC"
  }
}

# Internet gateway for the public subnet    
resource "aws_internet_gateway" "demoIG" {           # ensure to remove the internet gateway from the default vpc first and then apply.
  vpc_id = "${aws_default_vpc.test_vpc.id}"
  tags = {
    Name = "ecsDemoIG"
  }
}

# Public subnet
resource "aws_subnet" "test_public_sn_01" {
  vpc_id = "${aws_default_vpc.test_vpc.id}"
  cidr_block = "172.31.15.0/20"
  availability_zone = "us-east-1a"
  tags = {
    Name = "ecstest_public_sn_01-0"
  }
}

# Public subnet
resource "aws_subnet" "test_public_sn_02" {
  vpc_id = "${aws_default_vpc.test_vpc.id}"
  cidr_block = "172.31.23.0/20"
  availability_zone = "us-east-1b"
  tags = {
    Name = "ecstest_public_sn_02-0"
  }
}

# Routing table for public subnet
resource "aws_route_table" "test_public_sn_ro" {
  vpc_id = "${aws_default_vpc.test_vpc.id}"
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
    vpc_id = "${aws_default_vpc.test_vpc.id}"

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
