terraform {
  source = "../../modules//?ref=staging"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr      = "10.1.0.0/16"
  subnet_cidr   = "10.1.1.0/24"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  bucket_name   = "my-staging-bucket-456"
}