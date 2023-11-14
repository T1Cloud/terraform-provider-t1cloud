# to fetch standard image data
data "t1_compute_image" "astra" {
	os_distro = "astra"
	os_version = "1.7.3 Орёл"
}

# to fetch custom image data
data "t1_compute_image" "astra_custom" {
	custom_image_id = t1_compute_image.foo.id
}