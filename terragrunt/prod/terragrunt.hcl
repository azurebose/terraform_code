terraform {
  source = "../../modules//?ref=prod"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr      = "10.2.0.0/16"
  subnet_cidr   = "10.2.1.0/24"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.medium"
  bucket_name   = "my-prod-bucket-789"
}