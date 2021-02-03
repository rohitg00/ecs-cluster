
# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
  default = "<access key id>"
}

variable "aws_secret_access_key" {
  description = "AWS secret access key"
  default = "<access secret key>"
}

variable "ecs_cluster" {
  description = "ECS cluster name"
  default = "TestTim"
}

variable "ecs_key_pair_name" {
  description = "EC2 instance key pair name"
  default = "rg-key"

}

variable "region" {
  description = "AWS region"
  default = "ap-south-1"

}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  default = {
    ap-south-1 = "ap-south-1"
  }
}

########################### Test VPC Config ################################

variable "test_vpc" {
  description = "VPC name for Test environment"
  type = string
  default = "vpc-407a6528"
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

########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
  default = "3"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
  default = "1"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
  default = "2"
}
