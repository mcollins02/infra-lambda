output "public_ip" {
  value = "${module.web_server_cluster.public_ip}"
}

output "public_dns" {
    value = "${module.web_server_cluster.public_dns}"
}
