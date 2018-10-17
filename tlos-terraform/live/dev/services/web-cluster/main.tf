provider "aws" {
  region = "us-east-1"

}

module "web_server_cluster" {
  source = "/Users/mcollins/Documents/Projects/tlos-terraform/modules/services/web-cluster"

  cluster_name = "ROH"

  instance_type = "t2.micro"
  key_name = "terraform-key"
}
