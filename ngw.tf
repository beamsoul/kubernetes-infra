resource "aws_nat_gateway" "us-west-2a-kubernetesbrian-com" {
  allocation_id = "${aws_eip.us-west-2a-kubernetesbrian-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2a-kubernetesbrian-com.id}"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2a.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-west-2b-kubernetesbrian-com" {
  allocation_id = "${aws_eip.us-west-2b-kubernetesbrian-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2b-kubernetesbrian-com.id}"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2b.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_nat_gateway" "us-west-2c-kubernetesbrian-com" {
  allocation_id = "${aws_eip.us-west-2c-kubernetesbrian-com.id}"
  subnet_id     = "${aws_subnet.utility-us-west-2c-kubernetesbrian-com.id}"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2c.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}