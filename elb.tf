resource "aws_elb" "api-kubernetesbrian-com" {
  name = "api-kubernetesbrian-com-pp35cb"

  listener = {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.api-elb-kubernetesbrian-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-2a-kubernetesbrian-com.id}", "${aws_subnet.utility-us-west-2b-kubernetesbrian-com.id}", "${aws_subnet.utility-us-west-2c-kubernetesbrian-com.id}"]

  health_check = {
    target              = "SSL:443"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "api.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_elb" "bastion-kubernetesbrian-com" {
  name = "bastion-kubernetesbrian-c-m5fd75"

  listener = {
    instance_port     = 22
    instance_protocol = "TCP"
    lb_port           = 22
    lb_protocol       = "TCP"
  }

  security_groups = ["${aws_security_group.bastion-elb-kubernetesbrian-com.id}"]
  subnets         = ["${aws_subnet.utility-us-west-2a-kubernetesbrian-com.id}", "${aws_subnet.utility-us-west-2b-kubernetesbrian-com.id}", "${aws_subnet.utility-us-west-2c-kubernetesbrian-com.id}"]

  health_check = {
    target              = "TCP:22"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 10
    timeout             = 5
  }

  idle_timeout = 300

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "bastion.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}