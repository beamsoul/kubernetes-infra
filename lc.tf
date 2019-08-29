resource "aws_launch_configuration" "bastions-kubernetesbrian-com" {
  name_prefix                 = "bastions.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.bastion-kubernetesbrian-com.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2a-masters-kubernetesbrian-com" {
  name_prefix                 = "master-us-west-2a.masters.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesbrian-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2a.masters.kubernetesbrian.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2b-masters-kubernetesbrian-com" {
  name_prefix                 = "master-us-west-2b.masters.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesbrian-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2b.masters.kubernetesbrian.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2c-masters-kubernetesbrian-com" {
  name_prefix                 = "master-us-west-2c.masters.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesbrian-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2c.masters.kubernetesbrian.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-kubernetesbrian-com" {
  name_prefix                 = "nodes.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.nodes-kubernetesbrian-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.kubernetesbrian.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}
