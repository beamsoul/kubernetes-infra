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

