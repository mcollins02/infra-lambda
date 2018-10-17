terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "terraform-tlos"
    key            = "tlos-terraform/modules/services/web-cluster/CUSTOMER-NAME/terraform.state"  #SET CUSTOMER NAME HERE
    dynamodb_table = "DynamoDBLockTLOS"
  }
}
