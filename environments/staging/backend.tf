terraform {
  backend "s3" {
    bucket = "terraform-backend-staging"
    key    = "state/staging/terraform.tfstate"
    region = "us-west-2"
  }
}