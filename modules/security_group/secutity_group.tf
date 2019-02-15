module "vpc" {
  source = "../vpc"
}

# ECS Instance Security group
resource "aws_security_group" "vpc_public_sg" {
  name = "demo_pubic_sg"
  description = "demo public access security group"
  vpc_id = "${module.vpc.vpc_id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [
      "${var.vpc_access_from_ip_range}"]
  }

  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = [
      "${var.vpc_public_subnet_1_cidr}"]
  }

  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  tags {
    Name = "demo_pubic_sg"
  }
}

resource "aws_security_group" "vpc_private_sg" {
  name = "demo_private_sg"
  description = "demo security group to access private ports"
  vpc_id = "${module.vpc.vpc_id}"

  # allow memcached port within VPC
  ingress {
    from_port = 11211
    to_port = 11211
    protocol = "tcp"
    cidr_blocks = [
      "${var.vpc_public_subnet_1_cidr}"]
  }

  # allow redis port within VPC
  ingress {
    from_port = 6379
    to_port = 6379
    protocol = "tcp"
    cidr_blocks = [
      "${var.vpc_public_subnet_1_cidr}"]
  }

  # allow postgres port within VPC
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = [
      "${var.vpc_public_subnet_1_cidr}"]
  }

  # allow mysql port within VPC
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [
      "${var.vpc_public_subnet_1_cidr}"]
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
  tags {
    Name = "demo_private_sg"
  }
}
