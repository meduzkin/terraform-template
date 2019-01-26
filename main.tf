### Provider
provider "aws" {
  region = "${var.region_name}"
}
/// now keys used as system variables
// terraform {
//   backend "s3" {
//     encrypt = true
//     bucket = "terraform"
//     region = "${var.region_name}"
//     key = "bucketname/terraform.tfstate"
//   }
// }
### data
// data "aws_zone" {
//
// }
### IAM/policy

### SecurityGroups

### Network/VPC
data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}
resource "aws_subnet" "example" {
  vpc_id = "${var.project_name}-${var.environment_name}-standart-vpc"
  availability_zones = "${var.region_name}-1a", "${var.region_name}-1b"
  // vpc_id            = "${var.vpc_id}"
  // availability_zone = "${var.availability_zones}"
  // cidr_block        = "${cidrsubnet(data.aws_vpc.selected.cidr_block, 4, 1)}"
}

### EC2 (instances)

### S3

### RDS
