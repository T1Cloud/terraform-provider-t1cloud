resource "t1_compute_instance" "vm1" {
    network_interface = {}
}

resource "t1_compute_instance" "vm2" {
    network_interface = {}
}

resource "t1_vpc_vip" "foo" {
  region                  = "ru-central1"
  mode                    = "active-active"
  l2_enabled              = true
  internet_access_enabled = true
  subnet_id               = "subnet_id"
  fixed_ip                =  "10.128.0.61"
  network_interface_ids = [ 
    t1_compute_instance.vm1.network_interface.id,
    t1_compute_instance.vm2.network_interface.id,
   ]
}
