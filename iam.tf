
resource "aws_iam_instance_profile" "bastions-kubernetesbrian-com" {
  name = "bastions.kubernetesbrian.com"
  role = "${aws_iam_role.bastions-kubernetesbrian-com.name}"
}

resource "aws_iam_instance_profile" "masters-kubernetesbrian-com" {
  name = "masters.kubernetesbrian.com"
  role = "${aws_iam_role.masters-kubernetesbrian-com.name}"
}

resource "aws_iam_instance_profile" "nodes-kubernetesbrian-com" {
  name = "nodes.kubernetesbrian.com"
  role = "${aws_iam_role.nodes-kubernetesbrian-com.name}"
}

resource "aws_iam_role" "bastions-kubernetesbrian-com" {
  name               = "bastions.kubernetesbrian.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_bastions.kubernetesbrian.com_policy")}"
}

resource "aws_iam_role" "masters-kubernetesbrian-com" {
  name               = "masters.kubernetesbrian.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.kubernetesbrian.com_policy")}"
}

resource "aws_iam_role" "nodes-kubernetesbrian-com" {
  name               = "nodes.kubernetesbrian.com"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.kubernetesbrian.com_policy")}"
}

resource "aws_iam_role_policy" "bastions-kubernetesbrian-com" {
  name   = "bastions.kubernetesbrian.com"
  role   = "${aws_iam_role.bastions-kubernetesbrian-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_bastions.kubernetesbrian.com_policy")}"
}

resource "aws_iam_role_policy" "masters-kubernetesbrian-com" {
  name   = "masters.kubernetesbrian.com"
  role   = "${aws_iam_role.masters-kubernetesbrian-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.kubernetesbrian.com_policy")}"
}

resource "aws_iam_role_policy" "nodes-kubernetesbrian-com" {
  name   = "nodes.kubernetesbrian.com"
  role   = "${aws_iam_role.nodes-kubernetesbrian-com.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.kubernetesbrian.com_policy")}"
}
