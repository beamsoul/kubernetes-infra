resource "aws_ebs_volume" "a-etcd-events-kubernetesbrian-com" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "a.etcd-events.kubernetesbrian.com"
    "k8s.io/etcd/events"                        = "a/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_ebs_volume" "a-etcd-main-kubernetesbrian-com" {
  availability_zone = "us-west-2a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "a.etcd-main.kubernetesbrian.com"
    "k8s.io/etcd/main"                          = "a/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-events-kubernetesbrian-com" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "b.etcd-events.kubernetesbrian.com"
    "k8s.io/etcd/events"                        = "b/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_ebs_volume" "b-etcd-main-kubernetesbrian-com" {
  availability_zone = "us-west-2b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "b.etcd-main.kubernetesbrian.com"
    "k8s.io/etcd/main"                          = "b/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-events-kubernetesbrian-com" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "c.etcd-events.kubernetesbrian.com"
    "k8s.io/etcd/events"                        = "c/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_ebs_volume" "c-etcd-main-kubernetesbrian-com" {
  availability_zone = "us-west-2c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "c.etcd-main.kubernetesbrian.com"
    "k8s.io/etcd/main"                          = "c/a,b,c"
    "k8s.io/role/master"                        = "1"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}