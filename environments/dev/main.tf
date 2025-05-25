module "network" {
  source      = "../../modules/network"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "compute" {
  source        = "../../modules/compute"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.network.subnet_id
}

module "data" {
  source      = "../../modules/data"
  bucket_name = var.bucket_name
}