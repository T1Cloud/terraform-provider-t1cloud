resource "t1_compute_instance" "vm" {
  flavor = data.t1_compute_flavor.small
  image  = data.t1_compute_image.astra
  ssh_keys = [t1_compute_ssh_key.test.id]
  
  network_interface = {
    subnet_id = data.t1_vpc_network.default.subnets[0].id
  }
  system_volume = {
    size = 10
  }
}

resource "t1_compute_backup_container" "foo" {
  instance_id = t1_compute_instance.vm.id
  zone        = "ru-central1-a"
}
