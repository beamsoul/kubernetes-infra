
resource "aws_autoscaling_attachment" "bastions-kubernetesbrian-com" {
  elb                    = "${aws_elb.bastion-kubernetesbrian-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.bastions-kubernetesbrian-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2a-masters-kubernetesbrian-com" {
  elb                    = "${aws_elb.api-kubernetesbrian-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2a-masters-kubernetesbrian-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2b-masters-kubernetesbrian-com" {
  elb                    = "${aws_elb.api-kubernetesbrian-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2b-masters-kubernetesbrian-com.id}"
}

resource "aws_autoscaling_attachment" "master-us-west-2c-masters-kubernetesbrian-com" {
  elb                    = "${aws_elb.api-kubernetesbrian-com.id}"
  autoscaling_group_name = "${aws_autoscaling_group.master-us-west-2c-masters-kubernetesbrian-com.id}"
}