# Toggle Bucket Versioning
resource "t1_s3_bucket_versioning" "object" {
  bucket = "my-tf-test-bucket-new"
  status = "Enabled"
}