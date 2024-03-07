# Volume from standard image
data "t1_compute_image" "centos7" {
  os_distro  = "centos"
  os_version = "7"
}
resource "t1_compute_volume" "foo_centos7" {
  image     = data.t1_compute_image.centos7
  zone      = "ru-central1-a"
  size      = 4
  disk_type = "Light"
}

# Volume from custom image item
data "t1_compute_image" "custom" {
  custom_image_id = "my-custom-image-item-id"
}
resource "t1_compute_volume" "bar_custom" {
  size  = 10
  image = data.t1_compute_image.custom
  zone  = "ru-central1-a"
}

# Voume from snapshot
resource "t1_compute_volume" "bizz_snapshot" {
  snapshot_id = "snapshot_id"
  zone        = "ru-central1-a"
}