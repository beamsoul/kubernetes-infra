


















resource "aws_launch_configuration" "bastions-kubernetesbrian-com" {
  name_prefix                 = "bastions.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.bastions-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.bastion-kubernetesbrian-com.id}"]
  associate_public_ip_address = true

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 32
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2a-masters-kubernetesbrian-com" {
  name_prefix                 = "master-us-west-2a.masters.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesbrian-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2a.masters.kubernetesbrian.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2b-masters-kubernetesbrian-com" {
  name_prefix                 = "master-us-west-2b.masters.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesbrian-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2b.masters.kubernetesbrian.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "master-us-west-2c-masters-kubernetesbrian-com" {
  name_prefix                 = "master-us-west-2c.masters.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.masters-kubernetesbrian-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-west-2c.masters.kubernetesbrian.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 64
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

resource "aws_launch_configuration" "nodes-kubernetesbrian-com" {
  name_prefix                 = "nodes.kubernetesbrian.com-"
  image_id                    = "ami-0d8618ba6320df983"
  instance_type               = "m4.large"
  key_name                    = "${aws_key_pair.kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-kubernetesbrian-com.id}"
  security_groups             = ["${aws_security_group.nodes-kubernetesbrian-com.id}"]
  associate_public_ip_address = false
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.kubernetesbrian.com_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 128
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }

  enable_monitoring = false
}

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

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.kubernetesbrian-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.kubernetesbrian-com.id}"
}

resource "aws_route" "private-us-west-2a-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2a-kubernetesbrian-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2a-kubernetesbrian-com.id}"
}

resource "aws_route" "private-us-west-2b-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2b-kubernetesbrian-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2b-kubernetesbrian-com.id}"
}

resource "aws_route" "private-us-west-2c-0-0-0-0--0" {
  route_table_id         = "${aws_route_table.private-us-west-2c-kubernetesbrian-com.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.us-west-2c-kubernetesbrian-com.id}"
}

resource "aws_route53_record" "api-kubernetesbrian-com" {
  name = "api.kubernetesbrian.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.api-kubernetesbrian-com.dns_name}"
    zone_id                = "${aws_elb.api-kubernetesbrian-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/ZV7I94LHOG72H"
}

resource "aws_route53_record" "bastion-kubernetesbrian-com" {
  name = "bastion.kubernetesbrian.com"
  type = "A"

  alias = {
    name                   = "${aws_elb.bastion-kubernetesbrian-com.dns_name}"
    zone_id                = "${aws_elb.bastion-kubernetesbrian-com.zone_id}"
    evaluate_target_health = false
  }

  zone_id = "/hostedzone/ZV7I94LHOG72H"
}

resource "aws_route53_zone_association" "ZV7I94LHOG72H" {
  zone_id = "/hostedzone/ZV7I94LHOG72H"
  vpc_id  = "${aws_vpc.kubernetesbrian-com.id}"
}

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

