# Upload Object to Bucket
resource "t1_s3_bucket_object" "object" {
  bucket = "my-tf-test-bucket-new"
  key    = "new_object_key-newone"
  access    = "public-read"
  source = "/Users/mobypolo/Desktop/test.rtf"
}