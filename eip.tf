resource "aws_eip" "us-west-2a-kubernetesbrian-com" {
  vpc = true

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2a.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_eip" "us-west-2b-kubernetesbrian-com" {
  vpc = true

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2b.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_eip" "us-west-2c-kubernetesbrian-com" {
  vpc = true

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2c.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}