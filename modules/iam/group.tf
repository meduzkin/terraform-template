resource "aws_iam_group" "administrators" {
  name = "administrators"
  path = "/"
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    "${aws_iam_user.devops.name}",
  ]

  group = "${aws_iam_group.administrators.name}"
}

resource "aws_iam_group_policy_attachment" "administrators-attach" {
  group      = "${aws_iam_group.administrators.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
