data "t1_vpc_network" "default" {
  name = "default"
}

output "default_network_subnets" {
  description = "Subnets, that default Network contain within"
  value       = data.t1_vpc_network.default.subnets
}
