data "t1_compute_volume" "foo" {
  id = "my-volume-item-id"
}

output "foo_vol" {
  value       = data.t1_compute_volume.foo
  description = "Info about foo volume"
}
