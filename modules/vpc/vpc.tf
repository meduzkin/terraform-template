# Define a vpc
resource "aws_vpc" "vpc_name" {
  cidr_block = "${var.vpc_cidr_block}"
  tags {
    Name = "${var.vpc_name}"
  }
}

# Internet gateway for the public subnet
resource "aws_internet_gateway" "demo_ig" {
  vpc_id = "${aws_vpc.vpc_name.id}"
  tags {
    Name = "demo_ig"
  }
}

# Public subnet
resource "aws_subnet" "vpc_public_sn" {
  vpc_id = "${aws_vpc.vpc_name.id}"
  cidr_block = "${var.vpc_public_subnet_10_cidr}"
  // availability_zone = "${lookup(var.availability_zone, var.vpc_region)}"
  availability_zone = "${var.availability_zone}"
  tags {
    Name = "vpc_public_sn"
  }
}

# Private subnet
# resource "aws_subnet" "vpc_private_sn" {
#   vpc_id = "${aws_vpc.vpc_name.id}"
#   cidr_block = "${var.vpc_private_subnet_1_cidr}"
#   availability_zone = "us-west-2b"
#   tags {
#     Name = "vpc_private_sn"
#   }
# }

# # Routing table for public subnet
# resource "aws_route_table" "vpc_public_sn_rt" {
#   vpc_id = "${aws_vpc.vpc_name.id}"
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = "${aws_internet_gateway.demo_ig.id}"
#   }
#   tags {
#     Name = "vpc_public_sn_rt"
#   }
# }
# # Associate the routing table to public subnet
# resource "aws_route_table_association" "vpc_public_sn_rt_assn" {
#   subnet_id = "${aws_subnet.vpc_public_sn.id}"
#   route_table_id = "${aws_route_table.vpc_public_sn_rt.id}"
# }


output "vpc_id" {
  value = "${aws_vpc.vpc_name.id}"
}

output "vpc_public_sn_id" {
  value = "${aws_subnet.vpc_public_sn.id}"
}

# output "vpc_private_sn_id" {
#   value = "${aws_subnet.vpc_private_sn.id}"
# }

# // output "vpc_public_sg_id" {
# //   value = "${aws_security_group.vpc_public_sg.id}"
# // }
# //
# // output "vpc_private_sg_id" {
# //   value = "${aws_security_group.vpc_private_sg.id}"
# // }
