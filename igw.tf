resource "aws_internet_gateway" "kubernetesbrian-com" {
  vpc_id = "${aws_vpc.kubernetesbrian-com.id}"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}
