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
