### Provider
provider "aws" {
  shared_credentials_file = "/home/root/.aws/credentials"
  region = "${var.region_name}"
}

module "vpc" {
    source = "modules/vpc"
}
module "sg" {
  source = "modules/security_group"
  vpc_id = "${module.vpc.vpc_id}"
}
module "iam" {
  source = "modules/iam"
}
 module "ecs" {
   source = "modules/ecs"
   vpc_id = "${module.vpc.vpc_id}"
   vpc_security_group_ids = "${module.sg.devops_sg_id}"
   subnet_id = "${module.vpc.vpc_public_sn_id}"
   iam_instance_profile = "${module.iam.devops_iam_id}"
 }
