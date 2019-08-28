output "bastion_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.bastions-kubernetesbrian-com.id}"]
}

output "bastion_security_group_ids" {
  value = ["${aws_security_group.bastion-kubernetesbrian-com.id}"]
}

output "bastions_role_arn" {
  value = "${aws_iam_role.bastions-kubernetesbrian-com.arn}"
}

output "bastions_role_name" {
  value = "${aws_iam_role.bastions-kubernetesbrian-com.name}"
}

output "cluster_name" {
  value = "kubernetesbrian.com"
}

output "master_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.master-us-west-2a-masters-kubernetesbrian-com.id}", "${aws_autoscaling_group.master-us-west-2b-masters-kubernetesbrian-com.id}", "${aws_autoscaling_group.master-us-west-2c-masters-kubernetesbrian-com.id}"]
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-kubernetesbrian-com.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-kubernetesbrian-com.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-kubernetesbrian-com.name}"
}

output "node_autoscaling_group_ids" {
  value = ["${aws_autoscaling_group.nodes-kubernetesbrian-com.id}"]
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-kubernetesbrian-com.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-west-2a-kubernetesbrian-com.id}", "${aws_subnet.us-west-2b-kubernetesbrian-com.id}", "${aws_subnet.us-west-2c-kubernetesbrian-com.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-kubernetesbrian-com.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-kubernetesbrian-com.name}"
}

output "region" {
  value = "us-west-2"
}

output "route_table_private-us-west-2a_id" {
  value = "${aws_route_table.private-us-west-2a-kubernetesbrian-com.id}"
}

output "route_table_private-us-west-2b_id" {
  value = "${aws_route_table.private-us-west-2b-kubernetesbrian-com.id}"
}

output "route_table_private-us-west-2c_id" {
  value = "${aws_route_table.private-us-west-2c-kubernetesbrian-com.id}"
}

output "route_table_public_id" {
  value = "${aws_route_table.kubernetesbrian-com.id}"
}

output "subnet_us-west-2a_id" {
  value = "${aws_subnet.us-west-2a-kubernetesbrian-com.id}"
}

output "subnet_us-west-2b_id" {
  value = "${aws_subnet.us-west-2b-kubernetesbrian-com.id}"
}

output "subnet_us-west-2c_id" {
  value = "${aws_subnet.us-west-2c-kubernetesbrian-com.id}"
}

output "subnet_utility-us-west-2a_id" {
  value = "${aws_subnet.utility-us-west-2a-kubernetesbrian-com.id}"
}

output "subnet_utility-us-west-2b_id" {
  value = "${aws_subnet.utility-us-west-2b-kubernetesbrian-com.id}"
}

output "subnet_utility-us-west-2c_id" {
  value = "${aws_subnet.utility-us-west-2c-kubernetesbrian-com.id}"
}

output "vpc_cidr_block" {
  value = "${aws_vpc.kubernetesbrian-com.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.kubernetesbrian-com.id}"
}