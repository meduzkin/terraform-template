data "aws_ami" "centos" {
  most_recent = true
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

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  subnet_id = "${var.subnet_id}"
  iam_instance_profile = "${var.iam_instance_profile}"
  availability_zone = "${var.availability_zone}"
  associate_public_ip_address = true
  key_name = "devops"
  tags = {
    Name = "devops"
  }
}

resource "aws_key_pair" "devops" {
  key_name = "devops"
  #TODO
  public_key = "add_here_public_key"
  # sz ssh key
  #public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABBwYDE19M3kzGucOuxuimiuLZIAIy85MuNACbdwrzgeKQNr6rL0KJHLK06pYPTr+JGwyotqZ/npTTO+HFfqKo+TbN6o+KgJBK9zuSjmkolWqoFkVQBuzdBNnCBI4a0XfeaiirY33Kw/c5QwaCRUJGW18xx8ysw425bKnmIYc76/4t+Yc5scn1ZuI2yaRGSbn0wQbM73sBhRX0+XQrCPFbk+wZMeQuQdtWog2KTVl9WjfPuEN1ZkH+oPFnY5i6zkDrkQz2QCyEWY7qzxV1hv0wv0hk1aoDjkxtBCfNeAcGctXZGuGIKhNBfii5CbRZsMDzrPJR2JW4PC6RwdYXBrU89rWsQhUxT+f9" 
}
