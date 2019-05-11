### Provider
provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "/home/root/.aws/credentials"
  # region = "${var.region_name}"
}

module "vpc" {
    source = "modules/vpc"
}
# Configuring security groups
module "sg" {
  source = "modules/security_group"
}
# Configuring IAM
module "iam" {
  source = "modules/iam"
}
# 
#  # Configuring ECS
 module "ecs" {
   source = "modules/ecs"
 }
