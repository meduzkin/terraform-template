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
  # default = {
  #   us-west-2 = "us-west-2a"
  #   us-west-1 = "us-west-2b"
  # }
  default = "us-west-2a"
}

variable "vpc_name" {
  default = "development_vpc"
  description = "VPC for building demos"
}

variable "vpc_cidr_block" {
  default = "172.254.0.0/20"
  description = "All global network"
}

variable "vpc_private_subnet_10_cidr" {
  default = "172.254.10.0/24"
  description = "Private CIDR for internally accessible subnet"
}

variable "vpc_public_subnet_11_cidr" {
  default = "172.254.11.0/24"
  description = "Public 0.0 CIDR for externally accessible subnet"
}

variable "vpc_free_access" {
  default = "0.0.0.0/0"
  description = "Access can be made from the following IPs"
}


