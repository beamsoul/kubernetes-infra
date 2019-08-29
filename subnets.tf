resource "aws_subnet" "us-west-2a-kubernetesbrian-com" {
  vpc_id            = "${aws_vpc.kubernetesbrian-com.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "us-west-2a"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2a.kubernetesbrian.com"
    SubnetType                                  = "Private"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "us-west-2b-kubernetesbrian-com" {
  vpc_id            = "${aws_vpc.kubernetesbrian-com.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "us-west-2b"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2b.kubernetesbrian.com"
    SubnetType                                  = "Private"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "us-west-2c-kubernetesbrian-com" {
  vpc_id            = "${aws_vpc.kubernetesbrian-com.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "us-west-2c"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "us-west-2c.kubernetesbrian.com"
    SubnetType                                  = "Private"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}

resource "aws_subnet" "utility-us-west-2a-kubernetesbrian-com" {
  vpc_id            = "${aws_vpc.kubernetesbrian-com.id}"
  cidr_block        = "172.20.0.0/22"
  availability_zone = "us-west-2a"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "utility-us-west-2a.kubernetesbrian.com"
    SubnetType                                  = "Utility"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/role/elb"                    = "1"
  }
}

resource "aws_subnet" "utility-us-west-2b-kubernetesbrian-com" {
  vpc_id            = "${aws_vpc.kubernetesbrian-com.id}"
  cidr_block        = "172.20.4.0/22"
  availability_zone = "us-west-2b"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "utility-us-west-2b.kubernetesbrian.com"
    SubnetType                                  = "Utility"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/role/elb"                    = "1"
  }
}

resource "aws_subnet" "utility-us-west-2c-kubernetesbrian-com" {
  vpc_id            = "${aws_vpc.kubernetesbrian-com.id}"
  cidr_block        = "172.20.8.0/22"
  availability_zone = "us-west-2c"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "utility-us-west-2c.kubernetesbrian.com"
    SubnetType                                  = "Utility"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
    "kubernetes.io/role/elb"                    = "1"
  }
}