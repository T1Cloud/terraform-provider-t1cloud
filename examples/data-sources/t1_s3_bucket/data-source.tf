data "t1_s3_bucket" "current" {
  name = "test-name-1"
}
output "t1_canonical_user_id" {
    value = data.t1_s3_bucket.current
}