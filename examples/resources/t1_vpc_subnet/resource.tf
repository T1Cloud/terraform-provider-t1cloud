resource "t1_vpc_network" "foo" {
  name        = "My network"
  description = "description for my network"
}

resource "t1_vpc_subnet" "subnet1" {
  name        = "foo-subnet"
  description = "description for my subnet"
  region      = "ru-central1"
  cidr        = "10.128.0.1/24"
  network_id  = t1_vpc_network.foo.id
}
