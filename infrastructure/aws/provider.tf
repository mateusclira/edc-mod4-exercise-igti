provider "aws" {
  region = var.region_id
}

data "aws_caller_identity" "mateusclira" {}
data "aws_region" "us-east-1" {}



