resource "aws_autoscaling_group" "bastions-kubernetesbrian-com" {
  name                 = "bastions.kubernetesbrian.com"
  launch_configuration = "${aws_launch_configuration.bastions-kubernetesbrian-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.utility-us-west-2a-kubernetesbrian-com.id}", "${aws_subnet.utility-us-west-2b-kubernetesbrian-com.id}", "${aws_subnet.utility-us-west-2c-kubernetesbrian-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "bastions.kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "bastions"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/bastion"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}