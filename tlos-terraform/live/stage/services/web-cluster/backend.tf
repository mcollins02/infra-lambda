terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "terraform-tlos"
    key    = "tlos-terraform/modules/services/web-cluster/TBG/terraform.state"
    dynamodb_table = "DynamoDBLock"
  }
}
