data "t1_compute_flavor" "small" {
	vcpus          = 1
	ram            = 1
	family         = "general-purpose"
	cpu_series     = "Intel Cascade Lake 2.2 GHz"
	hardware_group = "public"
}

data "t1_compute_image" "astra" {
	os_distro  = "astra"
	os_version = "1.7.3 Орёл"
}

data "t1_vpc_network" "default" {
	name = "default"
}

resource "t1_compute_ssh_key" "test" {
	name        = "test-ssh"
	login       = "root"
	public_keys = [
	  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCD+ACR4ubu98ti0aJOxL/Nwn6dlV++PCDY4HrkgScacPxIVbgo82P/qJ/VJEc29AbKYLGDsJ1NoK8xp320UCv1FCDHzZMKEeUQU8lfTvpN2hvTQlYp42ooGSsJgp4AM4wVYs8UBfbOerXquV/rQ6t7QiECJXq5e3gNu9C7hioOmw== "
	]
}

resource "t1_compute_instance" "vm" {
  boot_volume = {
    size = 4
  }

  flavor = data.t1_compute_flavor.small
  image  = data.t1_compute_image.astra

  network_interface = {
    subnet_id = data.t1_vpc_network.default.subnets[0].id
  }
   ssh_keys = [
    t1_compute_ssh_key.ssh.id,
  ]
}
