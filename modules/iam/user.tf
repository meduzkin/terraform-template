resource "aws_iam_user" "devops" {
  name = "devops"
  path = "/"
}

resource "aws_iam_user" "s3" {
  name = "s3"
  path = "/"
}

resource "aws_iam_user_policy_attachment" "s3-attach" {
  user       = "${aws_iam_user.s3.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
