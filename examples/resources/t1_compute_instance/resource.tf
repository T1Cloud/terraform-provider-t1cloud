resource "t1_compute_instance" "vm" {
  boot_volume = {
    size                  = 4
    delete_on_termination = false
  }
  flavor = {
    cores  = 1
    memory = 2
  }
  image = {
    distro  = "ubuntu"
    version = "20.04"
  }
  ssh_keys = [
    t1_compute_ssh_key.ssh.id,
  ]
  network_interface = {
    fixed_ip  = "10.128.0.13"
    subnet_id = t1_vpc_subnet.subnet1.id,
    security_group_ids = [
      t1_vpc_security_group.foo.id,
    ]
  }
}

resource "t1_compute_ssh_key" "ssh" {
  name  = "foo"
  login = "root"
  publick_keys = [
    "my-public-key",
  ]
}

resource "t1_vpc_security_group" "sec_group" {
  name = "My security group"
}

resource "t1_vpc_network" "foo" {
  name = "My network"
}

resource "t1_vpc_subnet" "subnet1" {
  name       = "foo-subnet"
  region     = "ru-central1"
  cidr       = "10.128.0.1/24"
  network_id = t1_vpc_network.foo.id
}
