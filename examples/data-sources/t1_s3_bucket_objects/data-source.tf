data "t1_s3_bucket_objects" "current" {
  bucket = "bucket-name-here"
}
output "t1_canonical_user_id" {
    value = data.t1_s3_bucket_objects.current
}