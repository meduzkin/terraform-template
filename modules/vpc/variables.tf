variable "region_name" {
  default = "us-west-2"
}

variable "project_name" {
  default = "terraform-template"
}

variable "environment_name" {
  default = "development"
}

variable "availability_zone" {
  default = {
    us-east-1 = "us-east-1a"
    us-west-1 = "us-west-1a"
  }
}

variable "vpc_name" {
  default = "development_vpc"
  description = "VPC for building demos"
}

variable "vpc_cidr_block" {
  default = "172.254.0.0/20"
  description = "All global network"
}

variable "vpc_private_subnet_1_cidr" {
  default = "172.254.10.0/24"
  description = "Private CIDR for internally accessible subnet"
}

variable "vpc_public_subnet_1_cidr" {
  default = "172.254.11.0/24"
  description = "Public 0.0 CIDR for externally accessible subnet"
}

variable "vpc_free_access" {
  default = "0.0.0.0/0"
  description = "Access can be made from the following IPs"
}
