provider "aws" {
  region = "us-east-1"

}

module "web_server_cluster" {
  source = "git::ssh://git@stash.dev.carelogistics.com/~mcollins/tlos-modules.git//services/web-cluster?ref=v0.0.1"

  cluster_name = "TBG"

  instance_type = "t2.micro"
  key_name = "terraform-key"
}
