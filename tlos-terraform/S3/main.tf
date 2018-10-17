provider "aws" {
  region = "us-east-1"

}


#Creates S3 bucket for storing state files
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-tlos"
  force_destroy = true

  versioning {
    enabled = true
  }

}


#Creates DynmaoDB table for locking state file
resource "aws_dynamodb_table" "terraform_statelock" {
  name           = "DynamoDBLockTLOS"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
