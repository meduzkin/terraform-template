data "aws_ami" "centos" {
  most_recent = true
  # filter {
  #   name   = "name"
  #   values = ["centos/images/*centos7-*"]
  # }
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
  
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["aws-marketplace"]
}
variable "vpc_id" {}
variable "vpc_security_group_ids" {}
variable "subnet_id" {}
variable "iam_instance_profile" {}
# variable "vpc_private_sn_id" {}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t3.micro"
  # vpc_id = "${var.vpc_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  subnet_id = "${var.subnet_id}"
  iam_instance_profile = "${var.iam_instance_profile}"
  availability_zone = "${var.availability_zone}"
  tags = {
    Name = "devops"
  }
}


# resource "aws_instance" "my-test-instance" {
#   ami             = "${data.aws_ami.ubuntu.id}"
#   instance_type   = "t2.micro"

#   tags {
#     Name = "test-instance"
#   }
# }