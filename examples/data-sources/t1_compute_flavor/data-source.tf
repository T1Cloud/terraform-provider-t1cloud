data "t1_compute_flavor" "test" {
	vcpus = 2
	ram = 4
	family = "general-purpose"
	cpu_series = "Intel Cascade Lake 2.2 GHz"
}