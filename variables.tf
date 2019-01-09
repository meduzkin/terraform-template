variable "region_name" {
  default = "ap-southeast-1"
}

variable "project_name" {
  default = "terraform-template"
}

variable "environment_name" {
  default = "development"
}

variable "availability_zones" {
  default = ["${var.region_name}-1a", "${var.region_name}-1b"]
}

variable "vpc_id" {
  default = "${var.project_name}-${var.environment_name}-standart-vpc"
}
