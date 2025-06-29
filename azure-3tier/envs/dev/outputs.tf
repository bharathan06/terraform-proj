output "vnet_id" {
  value = module.network.vnet_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "nsg_public_id" {
  value = module.network.nsg_public_id
}

output "nsg_private_id" {
  value = module.network.nsg_private_id
}
