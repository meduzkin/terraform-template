module "vpc" {
  source = "../vpc"
}
module "secutiry_group" {
  source = "../secutiry_group"
}


resource "aws_instance" "web" {
  ami           = "ami-0b4dd9d65556cac22"
  instance_type = "t3.micro"
  subnet_id = "${module.vpc.vpc_id}"
  tags = {
    Name = "devops"
  }
  storage 20gb gp2

  vpc_security_group_ids = "${module.sg.devopsisntance}"
  !!!IAM_ROLE
  iam_instance_profile = "${module.iam.POLICTY_ROLE_NAME}"
}
