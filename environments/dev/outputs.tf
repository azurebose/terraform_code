output "instance_id" {
  value = module.compute.instance_id
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "bucket_arn" {
  value = module.data.bucket_arn
}