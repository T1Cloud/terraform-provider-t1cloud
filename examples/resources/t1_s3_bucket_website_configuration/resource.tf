# Toggle and configure bucket website mode
resource "t1_s3_bucket_website_configuration" "object" {
  bucket = "my-tf-test-bucket-new"
  error_page = "error.html"
  index_page = "index.html"
  is_enabled = false
}