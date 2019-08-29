resource "aws_key_pair" "kubernetes-kubernetesbrian-com-51a054289316f0f9e887266ae9c46d4d" {
  key_name   = "kubernetes.kubernetesbrian.com-51:a0:54:28:93:16:f0:f9:e8:87:26:6a:e9:c4:6d:4d"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.kubernetesbrian.com-51a054289316f0f9e887266ae9c46d4d_public_key")}"
}