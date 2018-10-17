resource "null_resource" "provision_tlos" {

  connection {
    type        = "ssh"
    host        = "${aws_instance.tlos.public_ip}"
    user        = "ec2-user"
    private_key = "${file("${var.key_location}")}"
    agent       = false
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 120",
      "sudo certbot --nginx certonly -n --domain ${var.customer_dns}.cltest4.com",
      "sudo fuser -k 443/tcp",
    ]
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${aws_instance.tlos.public_ip},' -u ec2-user --private-key ${var.key_location} --extra-vars dns=${var.customer_dns}.cltest4.com master.yml"

  }
}
