data "t1_compute_snapshot" "foo" {
    id = "my-snapshot-item-id"
}

output "snapshot_info" {
  value       = data.t1_compute_snapshot.foo
  description = "Info about foo snapshot"
}