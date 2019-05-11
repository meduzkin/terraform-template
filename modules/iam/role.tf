resource "aws_iam_role" "iam_devops_role" {
  name = "iam_devops_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "S3bucketDockerRegistry" {
  name = "S3bucketDockerRegistry"
  role = "${aws_iam_role.iam_devops_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "devops-AmazonEC2FullAccess" {
  role       = "${aws_iam_role.iam_devops_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "devops-AmazonEC2ContainerRegistryFullAccess" {
  role       = "${aws_iam_role.iam_devops_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

resource "aws_iam_role_policy_attachment" "devops-AmazonEC2ContainerServiceFullAccess" {
  role       = "${aws_iam_role.iam_devops_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerServiceFullAccess"
}

resource "aws_iam_role_policy_attachment" "devops-AmazonEC2ContainerServiceforEC2Role" {
  role       = "${aws_iam_role.iam_devops_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "devops-AmazonEC2ContainerServiceRole" {
  role       = "${aws_iam_role.iam_devops_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

resource "aws_iam_role" "iam_ecs_role" {
  name = "iam_ecs_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs-AmazonEC2FullAccess" {
  role       = "${aws_iam_role.iam_ecs_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs-AmazonEC2ContainerServiceFullAccess" {
  role       = "${aws_iam_role.iam_ecs_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerServiceFullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs-AmazonEC2ContainerServiceforEC2Role" {
  role       = "${aws_iam_role.iam_ecs_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ecs-AmazonEC2ContainerServiceRole" {
  role       = "${aws_iam_role.iam_ecs_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

resource "aws_iam_role" "ecsservicerole" {
  name = "ecsServiceRole"

  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecsservice-AmazonEC2ContainerServiceRole" {
  role       = "${aws_iam_role.ecsservicerole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}
