module "vpc" {
  source = "../vpc"
}
module "sg" {
  source = "../security_group"
}

module "iam" {
  source = "../iam"
}

resource "aws_instance" "web" {
  ami           = "ami-0b4dd9d65556cac22"
  instance_type = "t3.micro"
  subnet_id = "${module.vpc.vpc_id}"
  tags = {
    Name = "devops"
  }
  vpc_security_group_ids = ["${module.sg.devops_sg_id}"]
  # !!!IAM_ROLE
  iam_instance_profile = "${module.iam.sg_devops_id}"
}

# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  # }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# resource "aws_instance" "my-test-instance" {
#   ami             = "${data.aws_ami.ubuntu.id}"
#   instance_type   = "t2.micro"

#   tags {
#     Name = "test-instance"
#   }
# }