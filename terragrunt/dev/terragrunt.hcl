terraform {
  source = "../../modules//?ref=dev"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidr   = "10.0.1.0/24"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  bucket_name   = "my-dev-bucket-123"
}