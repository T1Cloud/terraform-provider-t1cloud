resource "t1_vpc_public_ip" "foo" {
  region = "ru-central1"
}

resource "t1_compute_floating_ip_associate" "associate" {
  instance_id = t1_compute_instance.vm.id
  floating_ip = t1_vpc_public_ip.foo.floating_ip
}
