resource "t1_compute_volume" "foo" {
  zone      = "ru-central1-a"
  name      = "foo"
}

resource "t1_compute_snapshot" "foo" {
  name             = "foo-snapshot"
  source_volume_id = t1_compute_volume.foo.item_id
}
