resource "t1_compute_volume" "foo" {
  zone      = "ru-central1-a"
  name      = "foo"
  size      = 12
  disk_type = "Basic"
  image = {
    distro  = "ubuntu"
    version = "20.04"
  }
  attachment = {
    instance_id           = t1_compute_instance.vm.id
    delete_on_termination = true
  }
}

# Voume from snapshot

resource "t1_compute_volume" "bar" {
  name        = "bar"
  snapshot_id = "snapshot_id"
}

# Volume from custom compute image

resource "t1_compute_volume" "buzz" {
  name            = "buzz"
  custom_image_id = "custom_image_id"
}
