terraform {
  backend "s3" {
    bucket = "terraform-backend-dev"
    key    = "state/dev/terraform.tfstate"
    region = "us-west-2"
  }
}