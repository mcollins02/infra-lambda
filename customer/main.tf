provider "aws" {
  region = "us-east-1"

}

module "web_server_cluster" {
  source         = "git::ssh://git@stash.dev.carelogistics.com/~mcollins/tlos-modules.git//services/web-cluster"

  cluster_name   = "TEST-NAME"                #ENTER CUSTOMER NAME HERE

  ec2_count      = 1
  instance_type  = "t2.micro"                 #SELECT EC2 INSTANCE TYPE
  customer_ip    = "0.0.0.0/0"                #Customer IP range for access
  customer_dns   = "CUSTOMER-DNS"             #Customer DNS entry
  key_name       = "terraform-key"            #NAME OF AWS Instance KEY PAIR GOES HERE
  key_location   = "PATH TO KEYS"             #PATH SSH EC2 PRIVATE KEY
}
