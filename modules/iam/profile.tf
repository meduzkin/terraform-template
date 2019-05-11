resource "aws_iam_instance_profile" "iam_devops_role" {
  name  = "iam_devops_role"
  role = "${aws_iam_role.iam_devops_role.name}"
}

resource "aws_iam_instance_profile" "iam_ecs_role" {
  name  = "iam_ecs_role"
  role = "${aws_iam_role.iam_ecs_role.name}"
}

output "devops_iam_id" {
  value = "${aws_iam_instance_profile.iam_devops_role.id}"
}