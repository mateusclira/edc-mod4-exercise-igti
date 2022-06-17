variable "region_id" {
  default = "us-east-1"
}

variable "prefix" {
  default = "igti-mateus-mod4"
}

variable "account" {
  default = 608636080729
}

# Prefix configuration and project common tags
locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Project      = "Datalake"
    ManagedBy    = "Terraform"
    Department   = "systems",
    Provider     = "Mateus",
    Owner        = "Data Engineering"
    BusinessUnit = "Data"
    Billing      = "Infrastructure"
    Environment  = terraform.workspace
    UserEmail    = "mateusc.lira@gmail.com"
  }
}

variable "bucket_names" {
  description = "Create S3 buckets with these names"
  type        = list(string)
  default = [
    "landing-zone",
    "processing-zone",
    "delivery-zone"
  ]
}