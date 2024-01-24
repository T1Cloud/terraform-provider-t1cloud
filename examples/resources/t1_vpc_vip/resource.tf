resource "t1_compute_instance" "vm1" {
    # ...
} 

resource "t1_compute_instance" "vm2" {
    # ...
} 

resource "t1_vpc_vip" "foo" {
  region                  = "ru-central1"
  mode                    = "active-active"
  internet_access_enabled = true
  subnet_id               = "subnet_id"
  l2_enabled              = true
  vmac_address            = "30:49:8f:e9:6b:e7"
  fixed_ip                =  "10.128.0.61"
  network_interface_ids = [ 
    t1_compute_instance.vm1.network_interface.id,
    t1_compute_instance.vm2.network_interface.id,
   ]
}
