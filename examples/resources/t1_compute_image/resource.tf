resource "t1_compute_volume" "foo" {
  zone      = "ru-central1-a"
  name      = "foo"
}

resource "t1_compute_image" "foo" {
  name             = "foo-image"
  source_volume_id = t1_compute_volume.foo.item_id
}
