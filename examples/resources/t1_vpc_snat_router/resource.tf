resource "t1_vpc_network" "network1" {
  name = "network1"
}

resource "t1_vpc_network" "network2" {
  name = "network2"
}

resource "t1_vpc_snat_router" "foo" {
  region = "ru-central1"
  network_ids = [
    t1_vpc_network.network1.id,
    t1_vpc_network.network2.id,
  ]
}
