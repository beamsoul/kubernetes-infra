resource "aws_route_table" "kubernetesbrian-com" {
  vpc_id = "${aws_vpc.kubernetesbrian-com.id}"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/kops/role"                   = "public"
  }
}

resource "aws_route_table" "private-us-west-2a-kubernetesbrian-com" {
  vpc_id = "${aws_vpc.kubernetesbrian-com.id}"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "private-us-west-2a.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/kops/role"                   = "private-us-west-2a"
  }
}

resource "aws_route_table" "private-us-west-2b-kubernetesbrian-com" {
  vpc_id = "${aws_vpc.kubernetesbrian-com.id}"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "private-us-west-2b.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/kops/role"                   = "private-us-west-2b"
  }
}

resource "aws_route_table" "private-us-west-2c-kubernetesbrian-com" {
  vpc_id = "${aws_vpc.kubernetesbrian-com.id}"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "private-us-west-2c.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/kops/role"                   = "private-us-west-2c"
  }
}