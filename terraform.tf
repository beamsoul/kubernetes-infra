resource "aws_vpc_dhcp_options_association" "kubernetesbrian-com" {
  vpc_id          = "${aws_vpc.kubernetesbrian-com.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.kubernetesbrian-com.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
