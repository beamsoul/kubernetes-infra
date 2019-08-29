resource "aws_autoscaling_group" "master-us-west-2a-masters-kubernetesbrian-com" {
  name                 = "master-us-west-2a.masters.kubernetesbrian.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2a-masters-kubernetesbrian-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2a-kubernetesbrian-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2a.masters.kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2a"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2b-masters-kubernetesbrian-com" {
  name                 = "master-us-west-2b.masters.kubernetesbrian.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2b-masters-kubernetesbrian-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2b-kubernetesbrian-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2b.masters.kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2b"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}

resource "aws_autoscaling_group" "master-us-west-2c-masters-kubernetesbrian-com" {
  name                 = "master-us-west-2c.masters.kubernetesbrian.com"
  launch_configuration = "${aws_launch_configuration.master-us-west-2c-masters-kubernetesbrian-com.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-west-2c-kubernetesbrian-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-west-2c.masters.kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "master-us-west-2c"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}
