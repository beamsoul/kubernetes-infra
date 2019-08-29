

























resource "aws_route_table_association" "private-us-west-2a-kubernetesbrian-com" {
  subnet_id      = "${aws_subnet.us-west-2a-kubernetesbrian-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2a-kubernetesbrian-com.id}"
}

resource "aws_route_table_association" "private-us-west-2b-kubernetesbrian-com" {
  subnet_id      = "${aws_subnet.us-west-2b-kubernetesbrian-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2b-kubernetesbrian-com.id}"
}

resource "aws_route_table_association" "private-us-west-2c-kubernetesbrian-com" {
  subnet_id      = "${aws_subnet.us-west-2c-kubernetesbrian-com.id}"
  route_table_id = "${aws_route_table.private-us-west-2c-kubernetesbrian-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2a-kubernetesbrian-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2a-kubernetesbrian-com.id}"
  route_table_id = "${aws_route_table.kubernetesbrian-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2b-kubernetesbrian-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2b-kubernetesbrian-com.id}"
  route_table_id = "${aws_route_table.kubernetesbrian-com.id}"
}

resource "aws_route_table_association" "utility-us-west-2c-kubernetesbrian-com" {
  subnet_id      = "${aws_subnet.utility-us-west-2c-kubernetesbrian-com.id}"
  route_table_id = "${aws_route_table.kubernetesbrian-com.id}"
}

resource "aws_security_group" "api-elb-kubernetesbrian-com" {
  name        = "api-elb.kubernetesbrian.com"
  vpc_id      = "${aws_vpc.kubernetesbrian-com.id}"
  description = "Security group for api ELB"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "api-elb.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_security_group" "bastion-elb-kubernetesbrian-com" {
  name        = "bastion-elb.kubernetesbrian.com"
  vpc_id      = "${aws_vpc.kubernetesbrian-com.id}"
  description = "Security group for bastion ELB"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "bastion-elb.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_security_group" "bastion-kubernetesbrian-com" {
  name        = "bastion.kubernetesbrian.com"
  vpc_id      = "${aws_vpc.kubernetesbrian-com.id}"
  description = "Security group for bastion"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "bastion.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_security_group" "masters-kubernetesbrian-com" {
  name        = "masters.kubernetesbrian.com"
  vpc_id      = "${aws_vpc.kubernetesbrian-com.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "masters.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_security_group" "nodes-kubernetesbrian-com" {
  name        = "nodes.kubernetesbrian.com"
  vpc_id      = "${aws_vpc.kubernetesbrian-com.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "nodes.kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.masters-kubernetesbrian-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.masters-kubernetesbrian-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "api-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.api-elb-kubernetesbrian-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-kubernetesbrian-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-elb-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.bastion-elb-kubernetesbrian-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "bastion-to-master-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.bastion-kubernetesbrian-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "bastion-to-node-ssh" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.bastion-kubernetesbrian-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-kubernetesbrian-com.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https-elb-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.api-elb-kubernetesbrian-com.id}"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.api-elb-kubernetesbrian-com.id}"
  from_port         = 3
  to_port           = 4
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-kubernetesbrian-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  from_port                = 1
  to_port                  = 2379
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  from_port                = 2382
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetesbrian-com.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-elb-to-bastion" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.bastion-kubernetesbrian-com.id}"
  source_security_group_id = "${aws_security_group.bastion-elb-kubernetesbrian-com.id}"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "ssh-external-to-bastion-elb-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.bastion-elb-kubernetesbrian-com.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

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

resource "aws_vpc" "kubernetesbrian-com" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "kubernetesbrian-com" {
  domain_name         = "us-west-2.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster                           = "kubernetesbrian.com"
    Name                                        = "kubernetesbrian.com"
    "kubernetes.io/cluster/kubernetesbrian.com" = "owned"
  }
}

