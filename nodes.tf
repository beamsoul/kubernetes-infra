resource "aws_autoscaling_group" "nodes-kubernetesbrian-com" {
  name                 = "nodes.kubernetesbrian.com"
  launch_configuration = "${aws_launch_configuration.nodes-kubernetesbrian-com.id}"
  max_size             = "${var.node_max_size}"
  min_size             = "${var.node_min_size}"
  vpc_zone_identifier  = ["${aws_subnet.us-west-2a-kubernetesbrian-com.id}", "${aws_subnet.us-west-2b-kubernetesbrian-com.id}", "${aws_subnet.us-west-2c-kubernetesbrian-com.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.kubernetesbrian.com"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    value               = "nodes"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  metrics_granularity = "1Minute"
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
}