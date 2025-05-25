terraform {
  backend "s3" {
    bucket = "terraform-backend-prod"
    key    = "state/prod/terraform.tfstate"
    region = "us-west-2"
  }
}