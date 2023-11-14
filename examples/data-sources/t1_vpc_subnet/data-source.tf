data "t1_vpc_network" "default" {
  name = "default"
}

data "t1_vpc_subnet" "default_subnet" {
  network_id = data.t1_vpc_network.default.id
  name       = "default-ru-central1"
}
