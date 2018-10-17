variable "instance_type" {
  description = "The type of EC2 instances to run (e.g. t2.micro)"
}

variable "key_name" {
  description = "Name of keypair used to connect to instance"
}

variable "cluster_name" {
  description = "Name of the customer cluster"
}

variable "customer_ip" {
  description = "IP address for customer access"
}

variable "ec2_count" {
  description = "Number of EC2 instances"
}

variable "customer_dns" {
  description = "DNS entry for customer"
}

variable "key_location" {
  description = "Path of EC2 ssh key"
}
