output "public_ip" {
  value = "${aws_instance.tlos.*.public_ip}"
}

output "public_dns" {
    value = "${aws_instance.tlos.*.public_dns}"
}

output "instance_tags" {
    value = "${aws_instance.tlos.tags.CNAME}"
}
