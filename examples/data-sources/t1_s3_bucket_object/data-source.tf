data "t1_s3_bucket_object" "current" {
  bucket = "bucket-name-here"
  key = "file-name-here"
}
output "t1_canonical_user_id" {
    value = data.t1_s3_bucket_object.current
}