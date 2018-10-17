output "public_ip" {
  value = "${module.web_server_cluster.public_ip}"
}

output "public_dns" {
    value = "${module.web_server_cluster.public_dns}"
}

output "instance_tags" {
    value = "${module.web_server_cluster.instance_tags}"
}
